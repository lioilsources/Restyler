import 'dart:typed_data';

import 'package:tsumiki_shared/tsumiki_shared.dart';

/// Face parsing of one prepared photo; the class maps are at the photo's size.
abstract interface class FaceParser {
  Future<FaceParse> parse(Uint8List bytes);
}
