// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      '이 빌드에는 서버 토큰이 없습니다(make run, .env.local). 분석은 작동하지만 렌더링은 작동하지 않습니다.';

  @override
  String get homeEmpty => '아직 아무것도 없습니다. 셀카로 시작해 보세요.';

  @override
  String get homeNew => '새 포토부스';

  @override
  String get delete => '삭제';

  @override
  String get statusRunning => '진행 중';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n프레임',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => '일부 실패';

  @override
  String get statusFailed => '실패';

  @override
  String get statusRejected => '시작되지 않음';

  @override
  String get statusLost => '서버에서 유실됨';

  @override
  String get selfieTitle => '셀카';

  @override
  String get selfieHint => '한 사람의 정면 인물 사진으로, 얼굴이 잘 보여야 합니다.';

  @override
  String get selfieAnalysing => '사진을 살펴보는 중…';

  @override
  String get takePhoto => '사진 찍기';

  @override
  String get pickGallery => '갤러리에서 선택';

  @override
  String get stepKeep => '그대로 두기';

  @override
  String get stepNext => '다음';

  @override
  String get hairTitle => '머리카락';

  @override
  String get beardTitle => '수염';

  @override
  String get glassesTitle => '안경';

  @override
  String get glassesFinish => '안경테';

  @override
  String get hairWomen => '여성';

  @override
  String get hairMen => '남성';

  @override
  String get hairKeepCut => '헤어스타일은 유지하고 색만 변경';

  @override
  String get hairColour => '색상';

  @override
  String hairColourOnPhoto(String colour) {
    return '색상(사진 속: $colour)';
  }

  @override
  String get hairNoChange => '변경 없음';

  @override
  String get stylesTitle => '스타일';

  @override
  String get frameCount => '프레임 수';

  @override
  String get mixes => '준비된 믹스';

  @override
  String pickedOf(int picked, int count) {
    return '$count개 중 $picked개 선택됨';
  }

  @override
  String get mediumIllustration => '회화';

  @override
  String get mediumPhoto => '사진';

  @override
  String get searchStyle => '스타일 검색';

  @override
  String get pickSomething => '편집이나 스타일을 하나 이상 선택하세요.';

  @override
  String get startBooth => '포토부스 시작';

  @override
  String get mixGalerie => '갤러리';

  @override
  String get mixKomiks => '팝과 만화';

  @override
  String get mixEpochy => '시대를 가로질러';

  @override
  String get mixAsie => '아시아';

  @override
  String get mixCesko => '체코의 발자취';

  @override
  String get boothTitle => '포토부스';

  @override
  String get boothSomeFailed => '일부 프레임이 실패했습니다. 해당 생성 횟수는 환불되었습니다.';

  @override
  String get layoutGrid => '격자';

  @override
  String get layoutStrip => '스트립';

  @override
  String get saveToPhotos => '사진에 저장';

  @override
  String get share => '공유';

  @override
  String get stripSaved => '스트립이 사진에 저장되었습니다.';

  @override
  String get stripSaveFailed => '스트립을 사진에 저장하지 못했습니다.';

  @override
  String get nothingReady => '아직 완성된 프레임이 없습니다.';

  @override
  String get rerun => '다시 실행';

  @override
  String rerunCost(int cost) {
    return '다시 실행($cost)';
  }

  @override
  String get clipDefaultName => '클립';

  @override
  String get clipAnimating => '움직이게 만드는 중…';

  @override
  String get clipDone => '완료';

  @override
  String get clipFailed => '실패했습니다. 생성 횟수는 환불되었습니다.';

  @override
  String get playClip => '클립 재생';

  @override
  String get clipSaved => '클립이 사진에 저장되었습니다.';

  @override
  String get clipSaveFailed => '클립을 사진에 저장하지 못했습니다.';

  @override
  String get clipCantPlay => '클립을 재생할 수 없습니다.';

  @override
  String get animate => '움직이게 하기';

  @override
  String get motionFast => '빠름, 몇 초 이내';

  @override
  String get motionSlow => '느림, 수십 분';

  @override
  String get tileNewLook => '새로운 룩';

  @override
  String get frameNotReady => '이 프레임은 아직 완성되지 않았습니다.';

  @override
  String get runNotStarted => '렌더링을 시작하지 못했습니다.';

  @override
  String get runFailedRefunded => '렌더링에 실패했습니다. 생성 횟수는 환불되었습니다.';

  @override
  String get runLost => '그 사이 서버가 재시작되어 렌더링이 유실되었습니다.';

  @override
  String get errNoFace => '얼굴을 찾지 못했습니다. 한 사람의 정면 인물 사진을 사용하세요.';

  @override
  String get errFaceTooSmall => '얼굴이 너무 작습니다. 머리와 어깨에 더 가깝게 사진을 자르세요.';

  @override
  String get errMaskTooSmallHair => '사진에 바꿀 만큼 머리카락이 충분하지 않습니다.';

  @override
  String get errMouthNotVisible => '입이 보여야 합니다. 얼굴 앞에 손을 두지 말고 렌즈를 바라보세요.';

  @override
  String get errNoBeardToShave => '사진에 면도할 수염이 없습니다.';

  @override
  String get errEyesNotVisible => '눈이 보여야 합니다. 눈을 손이나 머리카락으로 가리지 말고 렌즈를 바라보세요.';

  @override
  String get errMaskTooLarge => '얼굴이 너무 가깝습니다. 휴대폰을 더 멀리 잡으세요.';

  @override
  String get errNoGlassesToRemove => '사진에 안경이 없습니다.';

  @override
  String get errNothingToChange => '이 사진에는 바꿀 것이 없습니다.';

  @override
  String get errBusy =>
      '다른 렌더링이 진행 중입니다. 끝날 때까지는 새로 시작하거나 움직이게 할 수 없습니다. “바람에 날리는 머리카락” 클립은 약 20분이 걸릴 수 있습니다.';

  @override
  String get errOffline => '서버에 연결할 수 없습니다. 연결을 확인하고 다시 시도하세요.';

  @override
  String get errAccessDenied => '서버가 접근을 거부했습니다. 이 빌드의 토큰이 올바르지 않습니다.';

  @override
  String get errNotFound => '서버가 더 이상 이 렌더링을 알지 못합니다. 다시 시작하세요.';

  @override
  String get errPlanRejected => '서버가 계획을 거부했습니다. 이 사진은 보낼 수 없습니다.';

  @override
  String errServer(int status) {
    return '서버에 오류가 발생했습니다($status). 잠시 후 다시 시도하세요.';
  }

  @override
  String errGeneric(String error) {
    return '문제가 발생했습니다: $error';
  }

  @override
  String get photoUnreadable => '사진을 읽을 수 없습니다. JPEG 또는 PNG를 사용하세요.';

  @override
  String get stageWaitingServer => '서버를 기다리는 중…';

  @override
  String get stageBeard => '수염 편집 중…';

  @override
  String get stageGlasses => '안경을 씌우는 중…';

  @override
  String get stageHair => '머리카락을 자르는 중…';

  @override
  String get stageQueue => '대기열에서 기다리는 중…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total 그리는 중';
  }
}
