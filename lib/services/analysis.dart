import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:tsumiki_shared/tsumiki_shared.dart';

import 'errors.dart';
import 'face_parser.dart';
import 'photo.dart';
import 'worker.dart';

/// What the phone knows about a selfie. All masks come from this one analysis
/// of the original: the phone never sees an intermediate result.
class BoothAnalysis {
  const BoothAnalysis({
    required this.masks,
    required this.width,
    required this.height,
    required this.hairColour,
    required this.hasBeard,
    this.beardIssue,
    this.glassesIssue,
  });

  final HairAnalysis masks;
  final int width;
  final int height;

  /// Word read off the photo, null without enough hair.
  final String? hairColour;

  /// [detectBeard]: null = cannot tell.
  final bool? hasBeard;

  /// Why a whole step cannot run on this photo.
  final HairMaskException? beardIssue;
  final HairMaskException? glassesIssue;
}

HairMaskException? _probe(MaskResult Function() build) {
  try {
    build();
    return null;
  } on HairMaskException catch (e) {
    return e;
  }
}

/// Everything after the parser. Throws [HairMaskException] when the photo is
/// no use at all; a problem of one step lands in that step's issue, so a bald
/// head or covered eyes still leave the other steps open.
BoothAnalysis analyseParse(FaceParse parse, PreparedPhoto photo) {
  // Never `parse.resized`: nearest neighbour on a class map costs the eyes
  // 0.81–0.95 IoU, so a parser has to deliver the photo's size itself.
  if (parse.width != photo.width || parse.height != photo.height) {
    throw ArgumentError(
      'parser returned ${parse.width}×${parse.height}, '
      'the photo is ${photo.width}×${photo.height}',
    );
  }
  final masks = parse.toAnalysis();

  final fatal = _probe(
    () => buildHairMask(masks, const HairShape(length: HairLength.long)),
  );
  if (fatal != null && fatal.code != 'mask_too_small') throw fatal;

  final rgb = img
      .decodeImage(photo.bytes)!
      .convert(format: img.Format.uint8, numChannels: 3);
  return BoothAnalysis(
    masks: masks,
    width: photo.width,
    height: photo.height,
    hairColour: estimateHairColour(rgb, masks.hair),
    hasBeard: detectBeard(rgb, masks),
    beardIssue: _probe(
      () => buildBeardMask(masks, const BeardRegion(BeardRegionKind.full)),
    ),
    glassesIssue: _probe(() => buildGlassesMask(masks, const GlassesFit())),
  );
}

Future<PreparedPhoto> _prepare(Worker worker, Uint8List raw) =>
    worker(() => normalisePhoto(raw));

Future<BoothAnalysis> _analyse(
  Worker worker,
  FaceParse parse,
  PreparedPhoto photo,
) => worker(() => analyseParse(parse, photo));

/// Selfie → prepared photo + analysis. Nothing here touches the network or the
/// quota; the errors are shown before anything is sent.
Future<(PreparedPhoto, BoothAnalysis)> analyseSelfie(
  Uint8List raw,
  FaceParser parser,
  Worker worker,
) async {
  final photo = await _prepare(worker, raw);
  final parse = await parser.parse(photo.bytes);
  return (photo, await _analyse(worker, parse, photo));
}

/// Czech text of an analysis failure.
String analysisErrorText(Object e) => switch (e) {
  HairMaskException() => maskErrorText(e),
  PhotoException() => e.message,
  _ => '$e',
};
