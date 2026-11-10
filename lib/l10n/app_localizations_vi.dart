// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Bản dựng này không có mã thông báo máy chủ (make run, .env.local). Phân tích hoạt động, kết xuất thì không.';

  @override
  String get homeEmpty => 'Chưa có gì ở đây. Hãy bắt đầu bằng một bức selfie.';

  @override
  String get homeNew => 'Buồng chụp ảnh mới';

  @override
  String get delete => 'Xóa';

  @override
  String get statusRunning => 'Đang chạy';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n khung hình',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Một phần không thành công';

  @override
  String get statusFailed => 'Không thành công';

  @override
  String get statusRejected => 'Chưa chạy';

  @override
  String get statusLost => 'Bị mất trên máy chủ';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Ảnh chân dung chính diện của một người, thấy rõ khuôn mặt.';

  @override
  String get selfieAnalysing => 'Đang xem ảnh…';

  @override
  String get takePhoto => 'Chụp ảnh';

  @override
  String get pickGallery => 'Chọn từ thư viện';

  @override
  String get stepKeep => 'Giữ nguyên';

  @override
  String get stepNext => 'Tiếp';

  @override
  String get hairTitle => 'Tóc';

  @override
  String get beardTitle => 'Râu';

  @override
  String get glassesTitle => 'Kính';

  @override
  String get glassesFinish => 'Gọng';

  @override
  String get hairWomen => 'Nữ';

  @override
  String get hairMen => 'Nam';

  @override
  String get hairKeepCut => 'Giữ kiểu tóc, chỉ đổi màu';

  @override
  String get hairColour => 'Màu';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Màu (trong ảnh: $colour)';
  }

  @override
  String get hairNoChange => 'Không đổi';

  @override
  String get stylesTitle => 'Phong cách';

  @override
  String get frameCount => 'Bao nhiêu khung hình';

  @override
  String get mixes => 'Bộ mix có sẵn';

  @override
  String pickedOf(int picked, int count) {
    return 'Đã chọn $picked/$count';
  }

  @override
  String get mediumIllustration => 'Tranh vẽ';

  @override
  String get mediumPhoto => 'Ảnh';

  @override
  String get searchStyle => 'Tìm phong cách';

  @override
  String get pickSomething => 'Hãy chọn ít nhất một chỉnh sửa hoặc phong cách.';

  @override
  String get startBooth => 'Chạy buồng chụp ảnh';

  @override
  String get mixGalerie => 'Phòng tranh';

  @override
  String get mixKomiks => 'Pop và truyện tranh';

  @override
  String get mixEpochy => 'Xuyên các thời đại';

  @override
  String get mixAsie => 'Châu Á';

  @override
  String get mixCesko => 'Dấu ấn Séc';

  @override
  String get boothTitle => 'Buồng chụp ảnh';

  @override
  String get boothSomeFailed =>
      'Một số khung hình không thành công. Lượt tạo cho chúng đã được hoàn lại.';

  @override
  String get layoutGrid => 'Lưới';

  @override
  String get layoutStrip => 'Dải';

  @override
  String get saveToPhotos => 'Lưu vào Ảnh';

  @override
  String get share => 'Chia sẻ';

  @override
  String get stripSaved => 'Dải ảnh đã nằm trong Ảnh.';

  @override
  String get stripSaveFailed => 'Không thể lưu dải ảnh vào Ảnh.';

  @override
  String get nothingReady => 'Chưa có khung hình nào sẵn sàng.';

  @override
  String get rerun => 'Chạy lại';

  @override
  String rerunCost(int cost) {
    return 'Chạy lại ($cost)';
  }

  @override
  String get clipDefaultName => 'Clip';

  @override
  String get clipAnimating => 'Đang tạo chuyển động…';

  @override
  String get clipDone => 'Xong';

  @override
  String get clipFailed => 'Không thành công. Lượt tạo đã được hoàn lại.';

  @override
  String get playClip => 'Phát clip';

  @override
  String get clipSaved => 'Clip đã nằm trong Ảnh.';

  @override
  String get clipSaveFailed => 'Không thể lưu clip vào Ảnh.';

  @override
  String get clipCantPlay => 'Không thể phát clip.';

  @override
  String get animate => 'Tạo chuyển động';

  @override
  String get motionFast => 'Nhanh, trong vài giây';

  @override
  String get motionSlow => 'Chậm, hàng chục phút';

  @override
  String get tileNewLook => 'Diện mạo mới';

  @override
  String get frameNotReady => 'Khung hình này chưa sẵn sàng.';

  @override
  String get runNotStarted => 'Không thể bắt đầu kết xuất.';

  @override
  String get runFailedRefunded =>
      'Kết xuất không thành công. Lượt tạo đã được hoàn lại.';

  @override
  String get runLost =>
      'Máy chủ đã khởi động lại trong lúc đó và mất kết xuất.';

  @override
  String get errNoFace =>
      'Chúng tôi không tìm thấy khuôn mặt. Hãy dùng ảnh chân dung chính diện của một người.';

  @override
  String get errFaceTooSmall =>
      'Khuôn mặt quá nhỏ. Hãy cắt ảnh gần đầu và vai hơn.';

  @override
  String get errMaskTooSmallHair => 'Trong ảnh không có đủ tóc để thay đổi.';

  @override
  String get errMouthNotVisible =>
      'Phải thấy được miệng. Hãy nhìn vào ống kính, không để tay trước mặt.';

  @override
  String get errNoBeardToShave => 'Trong ảnh không có râu để cạo.';

  @override
  String get errEyesNotVisible =>
      'Phải thấy được mắt. Hãy nhìn vào ống kính, không để tay hay tóc che mắt.';

  @override
  String get errMaskTooLarge => 'Khuôn mặt quá gần. Hãy cầm điện thoại xa hơn.';

  @override
  String get errNoGlassesToRemove => 'Trong ảnh không có kính.';

  @override
  String get errNothingToChange => 'Ảnh này không có gì để thay đổi.';

  @override
  String get errBusy =>
      'Đang có một kết xuất khác chạy. Cho đến khi xong, bạn không thể bắt đầu kết xuất mới hay tạo chuyển động. Clip “tóc bay trong gió” có thể mất khoảng 20 phút.';

  @override
  String get errOffline =>
      'Không thể kết nối máy chủ. Hãy kiểm tra kết nối và thử lại.';

  @override
  String get errAccessDenied =>
      'Máy chủ từ chối truy cập. Bản dựng này có mã thông báo sai.';

  @override
  String get errNotFound =>
      'Máy chủ không còn biết kết xuất này. Hãy chạy lại.';

  @override
  String get errPlanRejected =>
      'Máy chủ đã từ chối kế hoạch. Không thể gửi ảnh này.';

  @override
  String errServer(int status) {
    return 'Máy chủ gặp lỗi ($status). Hãy thử lại sau ít phút.';
  }

  @override
  String errGeneric(String error) {
    return 'Đã xảy ra sự cố: $error';
  }

  @override
  String get photoUnreadable => 'Không thể đọc ảnh. Hãy dùng JPEG hoặc PNG.';

  @override
  String get stageWaitingServer => 'Đang chờ máy chủ…';

  @override
  String get stageBeard => 'Đang chỉnh râu…';

  @override
  String get stageGlasses => 'Đang đeo kính…';

  @override
  String get stageHair => 'Đang cắt tóc…';

  @override
  String get stageQueue => 'Đang chờ trong hàng đợi…';

  @override
  String stagePainting(int current, int total) {
    return 'Đang vẽ $current/$total';
  }
}
