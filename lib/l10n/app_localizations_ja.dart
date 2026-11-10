// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'このビルドにはサーバートークンがありません（make run、.env.local）。解析は動きますが、レンダリングは動きません。';

  @override
  String get homeEmpty => 'まだ何もありません。まずは自撮りから始めましょう。';

  @override
  String get homeNew => '新しいフォトブース';

  @override
  String get delete => '削除';

  @override
  String get statusRunning => '実行中';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nフレーム',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => '一部失敗';

  @override
  String get statusFailed => '失敗';

  @override
  String get statusRejected => '未開始';

  @override
  String get statusLost => 'サーバー上で失われました';

  @override
  String get selfieTitle => '自撮り';

  @override
  String get selfieHint => '一人を正面から撮ったポートレート。顔がはっきり見えるもの。';

  @override
  String get selfieAnalysing => '写真を確認中…';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get pickGallery => 'ギャラリーから選ぶ';

  @override
  String get stepKeep => 'そのまま';

  @override
  String get stepNext => '次へ';

  @override
  String get hairTitle => '髪';

  @override
  String get beardTitle => 'ひげ';

  @override
  String get glassesTitle => 'メガネ';

  @override
  String get glassesFinish => 'フレーム';

  @override
  String get hairWomen => '女性';

  @override
  String get hairMen => '男性';

  @override
  String get hairKeepCut => '髪型はそのまま、色だけ変える';

  @override
  String get hairColour => '色';

  @override
  String hairColourOnPhoto(String colour) {
    return '色（写真では：$colour）';
  }

  @override
  String get hairNoChange => '変更なし';

  @override
  String get stylesTitle => 'スタイル';

  @override
  String get frameCount => 'フレーム数';

  @override
  String get mixes => 'おまかせミックス';

  @override
  String pickedOf(int picked, int count) {
    return '$count件中$picked件を選択';
  }

  @override
  String get mediumIllustration => '絵画';

  @override
  String get mediumPhoto => '写真';

  @override
  String get searchStyle => 'スタイルを検索';

  @override
  String get pickSomething => '編集かスタイルを1つ以上選んでください。';

  @override
  String get startBooth => 'フォトブースを開始';

  @override
  String get mixGalerie => 'ギャラリー';

  @override
  String get mixKomiks => 'ポップとコミック';

  @override
  String get mixEpochy => '時代をめぐる旅';

  @override
  String get mixAsie => 'アジア';

  @override
  String get mixCesko => 'チェコの足跡';

  @override
  String get boothTitle => 'フォトブース';

  @override
  String get boothSomeFailed => '一部のフレームが失敗しました。その生成分は返却されました。';

  @override
  String get layoutGrid => 'グリッド';

  @override
  String get layoutStrip => 'ストリップ';

  @override
  String get saveToPhotos => '写真に保存';

  @override
  String get share => '共有';

  @override
  String get stripSaved => 'ストリップは写真に保存されました。';

  @override
  String get stripSaveFailed => 'ストリップを写真に保存できませんでした。';

  @override
  String get nothingReady => 'まだ完成したフレームはありません。';

  @override
  String get rerun => '再実行';

  @override
  String rerunCost(int cost) {
    return '再実行（$cost）';
  }

  @override
  String get clipDefaultName => 'クリップ';

  @override
  String get clipAnimating => '動かしています…';

  @override
  String get clipDone => '完了';

  @override
  String get clipFailed => '失敗しました。生成分は返却されました。';

  @override
  String get playClip => 'クリップを再生';

  @override
  String get clipSaved => 'クリップは写真に保存されました。';

  @override
  String get clipSaveFailed => 'クリップを写真に保存できませんでした。';

  @override
  String get clipCantPlay => 'クリップを再生できません。';

  @override
  String get animate => '動かす';

  @override
  String get motionFast => '速い（数秒）';

  @override
  String get motionSlow => '遅い（数十分）';

  @override
  String get tileNewLook => '新しいルック';

  @override
  String get frameNotReady => 'このフレームはまだ完成していません。';

  @override
  String get runNotStarted => 'レンダリングを開始できませんでした。';

  @override
  String get runFailedRefunded => 'レンダリングに失敗しました。生成分は返却されました。';

  @override
  String get runLost => 'その間にサーバーが再起動し、レンダリングが失われました。';

  @override
  String get errNoFace => '顔が見つかりませんでした。一人を正面から撮ったポートレートを使ってください。';

  @override
  String get errFaceTooSmall => '顔が小さすぎます。頭と肩に近づけて写真をトリミングしてください。';

  @override
  String get errMaskTooSmallHair => '写真に変更できるだけの髪がありません。';

  @override
  String get errMouthNotVisible => '口が見えている必要があります。顔の前に手を置かず、レンズを見てください。';

  @override
  String get errNoBeardToShave => '写真に剃れるひげがありません。';

  @override
  String get errEyesNotVisible => '目が見えている必要があります。目に手や髪がかからないようにして、レンズを見てください。';

  @override
  String get errMaskTooLarge => '顔が近すぎます。スマートフォンを遠ざけてください。';

  @override
  String get errNoGlassesToRemove => '写真にメガネがありません。';

  @override
  String get errNothingToChange => 'この写真には変更できるものがありません。';

  @override
  String get errBusy =>
      '別のレンダリングが実行中です。完了するまで、新しく開始することも動かすこともできません。「風になびく髪」のクリップは約20分かかることがあります。';

  @override
  String get errOffline => 'サーバーに接続できません。接続を確認して、もう一度お試しください。';

  @override
  String get errAccessDenied => 'サーバーがアクセスを拒否しました。このビルドのトークンが正しくありません。';

  @override
  String get errNotFound => 'サーバーはこのレンダリングをもう認識していません。もう一度開始してください。';

  @override
  String get errPlanRejected => 'サーバーがプランを拒否しました。この写真は送信できません。';

  @override
  String errServer(int status) {
    return 'サーバーでエラーが発生しました（$status）。しばらくしてからもう一度お試しください。';
  }

  @override
  String errGeneric(String error) {
    return '問題が発生しました：$error';
  }

  @override
  String get photoUnreadable => '写真を読み込めませんでした。JPEGまたはPNGを使ってください。';

  @override
  String get stageWaitingServer => 'サーバーを待っています…';

  @override
  String get stageBeard => 'ひげを編集中…';

  @override
  String get stageGlasses => 'メガネをかけています…';

  @override
  String get stageHair => '髪を切っています…';

  @override
  String get stageQueue => '順番待ち中…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total を描いています';
  }
}
