// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'บิลด์นี้ไม่มีโทเค็นเซิร์ฟเวอร์ (make run, .env.local) การวิเคราะห์ทำงานได้ แต่การเรนเดอร์ไม่ได้';

  @override
  String get homeEmpty => 'ยังไม่มีอะไรที่นี่ เริ่มด้วยเซลฟี่ก่อน';

  @override
  String get homeNew => 'ตู้ถ่ายรูปใหม่';

  @override
  String get delete => 'ลบ';

  @override
  String get statusRunning => 'กำลังทำงาน';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n เฟรม',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'บางส่วนไม่สำเร็จ';

  @override
  String get statusFailed => 'ไม่สำเร็จ';

  @override
  String get statusRejected => 'ยังไม่เริ่ม';

  @override
  String get statusLost => 'สูญหายบนเซิร์ฟเวอร์';

  @override
  String get selfieTitle => 'เซลฟี่';

  @override
  String get selfieHint => 'ภาพบุคคลหนึ่งคนจากด้านหน้า เห็นใบหน้าชัดเจน';

  @override
  String get selfieAnalysing => 'กำลังดูรูปภาพ…';

  @override
  String get takePhoto => 'ถ่ายรูป';

  @override
  String get pickGallery => 'เลือกจากแกลเลอรี';

  @override
  String get stepKeep => 'คงไว้';

  @override
  String get stepNext => 'ถัดไป';

  @override
  String get hairTitle => 'ผม';

  @override
  String get beardTitle => 'หนวดเครา';

  @override
  String get glassesTitle => 'แว่นตา';

  @override
  String get glassesFinish => 'กรอบแว่น';

  @override
  String get hairWomen => 'ผู้หญิง';

  @override
  String get hairMen => 'ผู้ชาย';

  @override
  String get hairKeepCut => 'คงทรงผมไว้ เปลี่ยนแค่สี';

  @override
  String get hairColour => 'สี';

  @override
  String hairColourOnPhoto(String colour) {
    return 'สี (ในรูป: $colour)';
  }

  @override
  String get hairNoChange => 'ไม่เปลี่ยน';

  @override
  String get stylesTitle => 'สไตล์';

  @override
  String get frameCount => 'กี่เฟรม';

  @override
  String get mixes => 'มิกซ์สำเร็จรูป';

  @override
  String pickedOf(int picked, int count) {
    return 'เลือกแล้ว $picked จาก $count';
  }

  @override
  String get mediumIllustration => 'ภาพวาด';

  @override
  String get mediumPhoto => 'รูปถ่าย';

  @override
  String get searchStyle => 'ค้นหาสไตล์';

  @override
  String get pickSomething => 'เลือกการแก้ไขหรือสไตล์อย่างน้อยหนึ่งอย่าง';

  @override
  String get startBooth => 'เริ่มตู้ถ่ายรูป';

  @override
  String get mixGalerie => 'แกลเลอรี';

  @override
  String get mixKomiks => 'ป็อปและคอมิก';

  @override
  String get mixEpochy => 'ผ่านยุคสมัย';

  @override
  String get mixAsie => 'เอเชีย';

  @override
  String get mixCesko => 'รอยเช็ก';

  @override
  String get boothTitle => 'ตู้ถ่ายรูป';

  @override
  String get boothSomeFailed =>
      'บางเฟรมไม่สำเร็จ คืนโควตาการสร้างของเฟรมเหล่านั้นแล้ว';

  @override
  String get layoutGrid => 'ตาราง';

  @override
  String get layoutStrip => 'แถบ';

  @override
  String get saveToPhotos => 'บันทึกลงรูปภาพ';

  @override
  String get share => 'แชร์';

  @override
  String get stripSaved => 'แถบอยู่ในรูปภาพแล้ว';

  @override
  String get stripSaveFailed => 'บันทึกแถบลงรูปภาพไม่ได้';

  @override
  String get nothingReady => 'ยังไม่มีเฟรมที่พร้อม';

  @override
  String get rerun => 'เรียกใช้อีกครั้ง';

  @override
  String rerunCost(int cost) {
    return 'เรียกใช้อีกครั้ง ($cost)';
  }

  @override
  String get clipDefaultName => 'คลิป';

  @override
  String get clipAnimating => 'กำลังทำให้เคลื่อนไหว…';

  @override
  String get clipDone => 'เสร็จแล้ว';

  @override
  String get clipFailed => 'ไม่สำเร็จ คืนโควตาการสร้างแล้ว';

  @override
  String get playClip => 'เล่นคลิป';

  @override
  String get clipSaved => 'คลิปอยู่ในรูปภาพแล้ว';

  @override
  String get clipSaveFailed => 'บันทึกคลิปลงรูปภาพไม่ได้';

  @override
  String get clipCantPlay => 'เล่นคลิปไม่ได้';

  @override
  String get animate => 'ทำให้เคลื่อนไหว';

  @override
  String get motionFast => 'เร็ว ภายในไม่กี่วินาที';

  @override
  String get motionSlow => 'ช้า หลายสิบนาที';

  @override
  String get tileNewLook => 'ลุคใหม่';

  @override
  String get frameNotReady => 'เฟรมนี้ยังไม่พร้อม';

  @override
  String get runNotStarted => 'เริ่มการเรนเดอร์ไม่ได้';

  @override
  String get runFailedRefunded => 'การเรนเดอร์ไม่สำเร็จ คืนโควตาการสร้างแล้ว';

  @override
  String get runLost =>
      'ระหว่างนั้นเซิร์ฟเวอร์รีสตาร์ตและทำให้การเรนเดอร์สูญหาย';

  @override
  String get errNoFace => 'ไม่พบใบหน้า ใช้ภาพบุคคลหนึ่งคนจากด้านหน้า';

  @override
  String get errFaceTooSmall =>
      'ใบหน้าเล็กเกินไป ครอปรูปให้ใกล้ศีรษะและไหล่มากขึ้น';

  @override
  String get errMaskTooSmallHair => 'ในรูปมีผมไม่พอให้เปลี่ยน';

  @override
  String get errMouthNotVisible =>
      'ต้องเห็นปาก มองเข้าเลนส์ และไม่ใช้มือบังหน้า';

  @override
  String get errNoBeardToShave => 'ในรูปไม่มีหนวดเคราให้โกน';

  @override
  String get errEyesNotVisible =>
      'ต้องเห็นดวงตา มองเข้าเลนส์ และไม่ใช้มือหรือผมบังตา';

  @override
  String get errMaskTooLarge => 'ใบหน้าใกล้เกินไป ถือโทรศัพท์ให้ไกลขึ้น';

  @override
  String get errNoGlassesToRemove => 'ในรูปไม่มีแว่นตา';

  @override
  String get errNothingToChange => 'รูปนี้ไม่มีอะไรให้เปลี่ยน';

  @override
  String get errBusy =>
      'มีการเรนเดอร์อื่นกำลังทำงานอยู่ จนกว่าจะเสร็จ คุณเริ่มอันใหม่หรือทำให้เคลื่อนไหวไม่ได้ คลิป “ผมปลิวตามลม” อาจใช้เวลาประมาณ 20 นาที';

  @override
  String get errOffline =>
      'เชื่อมต่อเซิร์ฟเวอร์ไม่ได้ ตรวจสอบการเชื่อมต่อแล้วลองอีกครั้ง';

  @override
  String get errAccessDenied =>
      'เซิร์ฟเวอร์ปฏิเสธการเข้าถึง บิลด์นี้มีโทเค็นไม่ถูกต้อง';

  @override
  String get errNotFound =>
      'เซิร์ฟเวอร์ไม่รู้จักการเรนเดอร์นี้อีกแล้ว เริ่มใหม่อีกครั้ง';

  @override
  String get errPlanRejected => 'เซิร์ฟเวอร์ปฏิเสธแผน ส่งรูปนี้ไม่ได้';

  @override
  String errServer(int status) {
    return 'เซิร์ฟเวอร์ผิดพลาด ($status) ลองอีกครั้งในอีกสักครู่';
  }

  @override
  String errGeneric(String error) {
    return 'เกิดข้อผิดพลาด: $error';
  }

  @override
  String get photoUnreadable => 'อ่านรูปไม่ได้ ใช้ไฟล์ JPEG หรือ PNG';

  @override
  String get stageWaitingServer => 'กำลังรอเซิร์ฟเวอร์…';

  @override
  String get stageBeard => 'กำลังแก้ไขหนวดเครา…';

  @override
  String get stageGlasses => 'กำลังใส่แว่นตา…';

  @override
  String get stageHair => 'กำลังตัดผม…';

  @override
  String get stageQueue => 'กำลังรอในคิว…';

  @override
  String stagePainting(int current, int total) {
    return 'กำลังวาด $current/$total';
  }
}
