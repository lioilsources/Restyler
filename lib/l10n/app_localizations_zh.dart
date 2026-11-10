// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken => '此构建没有服务器令牌（make run、.env.local）。分析可用，渲染不可用。';

  @override
  String get homeEmpty => '这里还没有内容。先拍一张自拍吧。';

  @override
  String get homeNew => '新建照相亭';

  @override
  String get delete => '删除';

  @override
  String get statusRunning => '进行中';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n 帧');
    return '$_temp0';
  }

  @override
  String get statusPartial => '部分失败';

  @override
  String get statusFailed => '失败';

  @override
  String get statusRejected => '未启动';

  @override
  String get statusLost => '在服务器上丢失';

  @override
  String get selfieTitle => '自拍';

  @override
  String get selfieHint => '一个人的正面肖像，面部清晰可见。';

  @override
  String get selfieAnalysing => '正在查看照片…';

  @override
  String get takePhoto => '拍照';

  @override
  String get pickGallery => '从相册选择';

  @override
  String get stepKeep => '保持不变';

  @override
  String get stepNext => '下一步';

  @override
  String get hairTitle => '头发';

  @override
  String get beardTitle => '胡须';

  @override
  String get glassesTitle => '眼镜';

  @override
  String get glassesFinish => '镜框';

  @override
  String get hairWomen => '女性';

  @override
  String get hairMen => '男性';

  @override
  String get hairKeepCut => '保留发型，只改颜色';

  @override
  String get hairColour => '颜色';

  @override
  String hairColourOnPhoto(String colour) {
    return '颜色（照片中：$colour）';
  }

  @override
  String get hairNoChange => '不改变';

  @override
  String get stylesTitle => '风格';

  @override
  String get frameCount => '帧数';

  @override
  String get mixes => '现成混搭';

  @override
  String pickedOf(int picked, int count) {
    return '已选 $picked/$count';
  }

  @override
  String get mediumIllustration => '绘画';

  @override
  String get mediumPhoto => '照片';

  @override
  String get searchStyle => '搜索风格';

  @override
  String get pickSomething => '请至少选择一项修改或一种风格。';

  @override
  String get startBooth => '启动照相亭';

  @override
  String get mixGalerie => '画廊';

  @override
  String get mixKomiks => '流行与漫画';

  @override
  String get mixEpochy => '穿越时代';

  @override
  String get mixAsie => '亚洲';

  @override
  String get mixCesko => '捷克印记';

  @override
  String get boothTitle => '照相亭';

  @override
  String get boothSomeFailed => '部分帧失败了。对应的生成次数已退还。';

  @override
  String get layoutGrid => '网格';

  @override
  String get layoutStrip => '长条';

  @override
  String get saveToPhotos => '存储到照片';

  @override
  String get share => '分享';

  @override
  String get stripSaved => '长条已存入照片。';

  @override
  String get stripSaveFailed => '无法将长条存入照片。';

  @override
  String get nothingReady => '还没有任何帧完成。';

  @override
  String get rerun => '重新运行';

  @override
  String rerunCost(int cost) {
    return '重新运行（$cost）';
  }

  @override
  String get clipDefaultName => '短片';

  @override
  String get clipAnimating => '正在生成动画…';

  @override
  String get clipDone => '完成';

  @override
  String get clipFailed => '失败了。生成次数已退还。';

  @override
  String get playClip => '播放短片';

  @override
  String get clipSaved => '短片已存入照片。';

  @override
  String get clipSaveFailed => '无法将短片存入照片。';

  @override
  String get clipCantPlay => '无法播放短片。';

  @override
  String get animate => '生成动画';

  @override
  String get motionFast => '快速，几秒内完成';

  @override
  String get motionSlow => '较慢，需要几十分钟';

  @override
  String get tileNewLook => '新造型';

  @override
  String get frameNotReady => '这一帧尚未完成。';

  @override
  String get runNotStarted => '无法启动渲染。';

  @override
  String get runFailedRefunded => '渲染失败。生成次数已退还。';

  @override
  String get runLost => '服务器在此期间重启，渲染已丢失。';

  @override
  String get errNoFace => '没有找到人脸。请使用一个人的正面肖像。';

  @override
  String get errFaceTooSmall => '人脸太小。请将照片裁剪得更靠近头部和肩膀。';

  @override
  String get errMaskTooSmallHair => '照片中的头发太少，无法更改。';

  @override
  String get errMouthNotVisible => '必须能看到嘴。请看向镜头，脸前不要有手。';

  @override
  String get errNoBeardToShave => '照片中没有可剃的胡须。';

  @override
  String get errEyesNotVisible => '必须能看到眼睛。请看向镜头，眼睛前不要有手或头发。';

  @override
  String get errMaskTooLarge => '人脸离得太近。请把手机拿远一些。';

  @override
  String get errNoGlassesToRemove => '照片中没有眼镜。';

  @override
  String get errNothingToChange => '这张照片没有可更改的内容。';

  @override
  String get errBusy =>
      '另一个渲染正在进行。在它完成之前，无法启动新的渲染，也无法生成动画。“风中的头发”短片可能需要约 20 分钟。';

  @override
  String get errOffline => '无法连接服务器。请检查网络连接后重试。';

  @override
  String get errAccessDenied => '服务器拒绝了访问。此构建的令牌有误。';

  @override
  String get errNotFound => '服务器已不认识这个渲染。请重新启动。';

  @override
  String get errPlanRejected => '服务器拒绝了方案。这张照片无法发送。';

  @override
  String errServer(int status) {
    return '服务器出错（$status）。请稍后再试。';
  }

  @override
  String errGeneric(String error) {
    return '出了点问题：$error';
  }

  @override
  String get photoUnreadable => '无法读取照片。请使用 JPEG 或 PNG。';

  @override
  String get stageWaitingServer => '正在等待服务器…';

  @override
  String get stageBeard => '正在修整胡须…';

  @override
  String get stageGlasses => '正在戴上眼镜…';

  @override
  String get stageHair => '正在剪发…';

  @override
  String get stageQueue => '正在排队…';

  @override
  String stagePainting(int current, int total) {
    return '正在绘制 $current/$total';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken => '此构建没有服务器令牌（make run、.env.local）。分析可用，渲染不可用。';

  @override
  String get homeEmpty => '这里还没有内容。先拍一张自拍吧。';

  @override
  String get homeNew => '新建照相亭';

  @override
  String get delete => '删除';

  @override
  String get statusRunning => '进行中';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n 帧');
    return '$_temp0';
  }

  @override
  String get statusPartial => '部分失败';

  @override
  String get statusFailed => '失败';

  @override
  String get statusRejected => '未启动';

  @override
  String get statusLost => '在服务器上丢失';

  @override
  String get selfieTitle => '自拍';

  @override
  String get selfieHint => '一个人的正面肖像，面部清晰可见。';

  @override
  String get selfieAnalysing => '正在查看照片…';

  @override
  String get takePhoto => '拍照';

  @override
  String get pickGallery => '从相册选择';

  @override
  String get stepKeep => '保持不变';

  @override
  String get stepNext => '下一步';

  @override
  String get hairTitle => '头发';

  @override
  String get beardTitle => '胡须';

  @override
  String get glassesTitle => '眼镜';

  @override
  String get glassesFinish => '镜框';

  @override
  String get hairWomen => '女性';

  @override
  String get hairMen => '男性';

  @override
  String get hairKeepCut => '保留发型，只改颜色';

  @override
  String get hairColour => '颜色';

  @override
  String hairColourOnPhoto(String colour) {
    return '颜色（照片中：$colour）';
  }

  @override
  String get hairNoChange => '不改变';

  @override
  String get stylesTitle => '风格';

  @override
  String get frameCount => '帧数';

  @override
  String get mixes => '现成混搭';

  @override
  String pickedOf(int picked, int count) {
    return '已选 $picked/$count';
  }

  @override
  String get mediumIllustration => '绘画';

  @override
  String get mediumPhoto => '照片';

  @override
  String get searchStyle => '搜索风格';

  @override
  String get pickSomething => '请至少选择一项修改或一种风格。';

  @override
  String get startBooth => '启动照相亭';

  @override
  String get mixGalerie => '画廊';

  @override
  String get mixKomiks => '流行与漫画';

  @override
  String get mixEpochy => '穿越时代';

  @override
  String get mixAsie => '亚洲';

  @override
  String get mixCesko => '捷克印记';

  @override
  String get boothTitle => '照相亭';

  @override
  String get boothSomeFailed => '部分帧失败了。对应的生成次数已退还。';

  @override
  String get layoutGrid => '网格';

  @override
  String get layoutStrip => '长条';

  @override
  String get saveToPhotos => '存储到照片';

  @override
  String get share => '分享';

  @override
  String get stripSaved => '长条已存入照片。';

  @override
  String get stripSaveFailed => '无法将长条存入照片。';

  @override
  String get nothingReady => '还没有任何帧完成。';

  @override
  String get rerun => '重新运行';

  @override
  String rerunCost(int cost) {
    return '重新运行（$cost）';
  }

  @override
  String get clipDefaultName => '短片';

  @override
  String get clipAnimating => '正在生成动画…';

  @override
  String get clipDone => '完成';

  @override
  String get clipFailed => '失败了。生成次数已退还。';

  @override
  String get playClip => '播放短片';

  @override
  String get clipSaved => '短片已存入照片。';

  @override
  String get clipSaveFailed => '无法将短片存入照片。';

  @override
  String get clipCantPlay => '无法播放短片。';

  @override
  String get animate => '生成动画';

  @override
  String get motionFast => '快速，几秒内完成';

  @override
  String get motionSlow => '较慢，需要几十分钟';

  @override
  String get tileNewLook => '新造型';

  @override
  String get frameNotReady => '这一帧尚未完成。';

  @override
  String get runNotStarted => '无法启动渲染。';

  @override
  String get runFailedRefunded => '渲染失败。生成次数已退还。';

  @override
  String get runLost => '服务器在此期间重启，渲染已丢失。';

  @override
  String get errNoFace => '没有找到人脸。请使用一个人的正面肖像。';

  @override
  String get errFaceTooSmall => '人脸太小。请将照片裁剪得更靠近头部和肩膀。';

  @override
  String get errMaskTooSmallHair => '照片中的头发太少，无法更改。';

  @override
  String get errMouthNotVisible => '必须能看到嘴。请看向镜头，脸前不要有手。';

  @override
  String get errNoBeardToShave => '照片中没有可剃的胡须。';

  @override
  String get errEyesNotVisible => '必须能看到眼睛。请看向镜头，眼睛前不要有手或头发。';

  @override
  String get errMaskTooLarge => '人脸离得太近。请把手机拿远一些。';

  @override
  String get errNoGlassesToRemove => '照片中没有眼镜。';

  @override
  String get errNothingToChange => '这张照片没有可更改的内容。';

  @override
  String get errBusy =>
      '另一个渲染正在进行。在它完成之前，无法启动新的渲染，也无法生成动画。“风中的头发”短片可能需要约 20 分钟。';

  @override
  String get errOffline => '无法连接服务器。请检查网络连接后重试。';

  @override
  String get errAccessDenied => '服务器拒绝了访问。此构建的令牌有误。';

  @override
  String get errNotFound => '服务器已不认识这个渲染。请重新启动。';

  @override
  String get errPlanRejected => '服务器拒绝了方案。这张照片无法发送。';

  @override
  String errServer(int status) {
    return '服务器出错（$status）。请稍后再试。';
  }

  @override
  String errGeneric(String error) {
    return '出了点问题：$error';
  }

  @override
  String get photoUnreadable => '无法读取照片。请使用 JPEG 或 PNG。';

  @override
  String get stageWaitingServer => '正在等待服务器…';

  @override
  String get stageBeard => '正在修整胡须…';

  @override
  String get stageGlasses => '正在戴上眼镜…';

  @override
  String get stageHair => '正在剪发…';

  @override
  String get stageQueue => '正在排队…';

  @override
  String stagePainting(int current, int total) {
    return '正在绘制 $current/$total';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken => '此版本沒有伺服器權杖（make run、.env.local）。分析可用，算圖不可用。';

  @override
  String get homeEmpty => '這裡還沒有內容。先拍一張自拍吧。';

  @override
  String get homeNew => '新增拍貼機';

  @override
  String get delete => '刪除';

  @override
  String get statusRunning => '進行中';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n 格');
    return '$_temp0';
  }

  @override
  String get statusPartial => '部分失敗';

  @override
  String get statusFailed => '失敗';

  @override
  String get statusRejected => '未啟動';

  @override
  String get statusLost => '在伺服器上遺失';

  @override
  String get selfieTitle => '自拍';

  @override
  String get selfieHint => '一個人的正面肖像，臉部清楚可見。';

  @override
  String get selfieAnalysing => '正在查看照片…';

  @override
  String get takePhoto => '拍照';

  @override
  String get pickGallery => '從相簿選擇';

  @override
  String get stepKeep => '維持不變';

  @override
  String get stepNext => '下一步';

  @override
  String get hairTitle => '頭髮';

  @override
  String get beardTitle => '鬍鬚';

  @override
  String get glassesTitle => '眼鏡';

  @override
  String get glassesFinish => '鏡框';

  @override
  String get hairWomen => '女性';

  @override
  String get hairMen => '男性';

  @override
  String get hairKeepCut => '保留髮型，只改顏色';

  @override
  String get hairColour => '顏色';

  @override
  String hairColourOnPhoto(String colour) {
    return '顏色（照片中：$colour）';
  }

  @override
  String get hairNoChange => '不變更';

  @override
  String get stylesTitle => '風格';

  @override
  String get frameCount => '格數';

  @override
  String get mixes => '現成混搭';

  @override
  String pickedOf(int picked, int count) {
    return '已選 $picked/$count';
  }

  @override
  String get mediumIllustration => '繪畫';

  @override
  String get mediumPhoto => '照片';

  @override
  String get searchStyle => '搜尋風格';

  @override
  String get pickSomething => '請至少選擇一項修改或一種風格。';

  @override
  String get startBooth => '啟動拍貼機';

  @override
  String get mixGalerie => '畫廊';

  @override
  String get mixKomiks => '流行與漫畫';

  @override
  String get mixEpochy => '穿越時代';

  @override
  String get mixAsie => '亞洲';

  @override
  String get mixCesko => '捷克印記';

  @override
  String get boothTitle => '拍貼機';

  @override
  String get boothSomeFailed => '部分格數失敗了。對應的生成次數已退還。';

  @override
  String get layoutGrid => '格狀';

  @override
  String get layoutStrip => '長條';

  @override
  String get saveToPhotos => '儲存到照片';

  @override
  String get share => '分享';

  @override
  String get stripSaved => '長條已儲存到照片。';

  @override
  String get stripSaveFailed => '無法將長條儲存到照片。';

  @override
  String get nothingReady => '還沒有任何一格完成。';

  @override
  String get rerun => '重新執行';

  @override
  String rerunCost(int cost) {
    return '重新執行（$cost）';
  }

  @override
  String get clipDefaultName => '短片';

  @override
  String get clipAnimating => '正在產生動畫…';

  @override
  String get clipDone => '完成';

  @override
  String get clipFailed => '失敗了。生成次數已退還。';

  @override
  String get playClip => '播放短片';

  @override
  String get clipSaved => '短片已儲存到照片。';

  @override
  String get clipSaveFailed => '無法將短片儲存到照片。';

  @override
  String get clipCantPlay => '無法播放短片。';

  @override
  String get animate => '產生動畫';

  @override
  String get motionFast => '快速，幾秒內完成';

  @override
  String get motionSlow => '較慢，需要幾十分鐘';

  @override
  String get tileNewLook => '新造型';

  @override
  String get frameNotReady => '這一格尚未完成。';

  @override
  String get runNotStarted => '無法啟動算圖。';

  @override
  String get runFailedRefunded => '算圖失敗。生成次數已退還。';

  @override
  String get runLost => '伺服器在此期間重新啟動，算圖已遺失。';

  @override
  String get errNoFace => '找不到臉部。請使用一個人的正面肖像。';

  @override
  String get errFaceTooSmall => '臉部太小。請將照片裁切得更靠近頭部和肩膀。';

  @override
  String get errMaskTooSmallHair => '照片中的頭髮太少，無法變更。';

  @override
  String get errMouthNotVisible => '必須看得到嘴巴。請看向鏡頭，臉前不要有手。';

  @override
  String get errNoBeardToShave => '照片中沒有可剃的鬍鬚。';

  @override
  String get errEyesNotVisible => '必須看得到眼睛。請看向鏡頭，眼睛前不要有手或頭髮。';

  @override
  String get errMaskTooLarge => '臉部離得太近。請把手機拿遠一點。';

  @override
  String get errNoGlassesToRemove => '照片中沒有眼鏡。';

  @override
  String get errNothingToChange => '這張照片沒有可變更的內容。';

  @override
  String get errBusy =>
      '另一個算圖正在進行。在它完成之前，無法啟動新的算圖，也無法產生動畫。「風中的頭髮」短片可能需要約 20 分鐘。';

  @override
  String get errOffline => '無法連線到伺服器。請檢查網路連線後再試一次。';

  @override
  String get errAccessDenied => '伺服器拒絕了存取。此版本的權杖有誤。';

  @override
  String get errNotFound => '伺服器已不認得這個算圖。請重新啟動。';

  @override
  String get errPlanRejected => '伺服器拒絕了方案。這張照片無法傳送。';

  @override
  String errServer(int status) {
    return '伺服器發生錯誤（$status）。請稍後再試。';
  }

  @override
  String errGeneric(String error) {
    return '發生問題：$error';
  }

  @override
  String get photoUnreadable => '無法讀取照片。請使用 JPEG 或 PNG。';

  @override
  String get stageWaitingServer => '正在等待伺服器…';

  @override
  String get stageBeard => '正在修整鬍鬚…';

  @override
  String get stageGlasses => '正在戴上眼鏡…';

  @override
  String get stageHair => '正在剪髮…';

  @override
  String get stageQueue => '正在排隊…';

  @override
  String stagePainting(int current, int total) {
    return '正在繪製 $current/$total';
  }
}
