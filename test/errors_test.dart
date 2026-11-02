import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:restyler/services/errors.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

void main() {
  test('every mask error has Czech text', () {
    for (final e in const [
      HairMaskException.noFace,
      HairMaskException.faceTooSmall,
      HairMaskException.maskTooSmall,
      HairMaskException.nothingToChange,
      HairMaskException.mouthNotVisible,
      HairMaskException.noBeardToShave,
      HairMaskException.eyesNotVisible,
      HairMaskException.maskTooLarge,
      HairMaskException.noGlassesToRemove,
    ]) {
      expect(kMaskErrors.containsKey(e.code), isTrue, reason: e.code);
    }
  });

  test('mask_too_small talks about hair only on the hair step', () {
    expect(
      maskErrorText(HairMaskException.maskTooSmall),
      contains('vlasů'),
    );
    expect(
      maskErrorText(HairMaskException.nothingToChange, MaskStep.beard),
      kNothingToChange,
    );
  });

  test('an unknown code falls back to the package text', () {
    expect(maskErrorText(const HairMaskException('new', 'nová')), 'nová');
  });

  test('429 explains the running render and names Oživit', () {
    final text = backendErrorText(const BackendException(429, 'wait'));
    expect(text, kBusyText);
    expect(text, contains('Oživit'));
    expect(text, contains('20 minut'));
    expect(text, isNot(contains('wait')));
  });

  test('other answers and network trouble are Czech too', () {
    expect(backendErrorText(const BackendException(403, 'x')), contains('přístup'));
    expect(backendErrorText(TimeoutException('x')), kOfflineText);
    expect(backendErrorText(http.ClientException('x')), kOfflineText);
  });
}
