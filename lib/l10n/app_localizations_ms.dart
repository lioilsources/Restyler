// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Binaan ini tiada token pelayan (make run, .env.local). Analisis berfungsi, render tidak.';

  @override
  String get homeEmpty => 'Belum ada apa-apa di sini. Mulakan dengan swafoto.';

  @override
  String get homeNew => 'Photo booth baharu';

  @override
  String get delete => 'Padam';

  @override
  String get statusRunning => 'Sedang berjalan';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n bingkai',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Sebahagian gagal';

  @override
  String get statusFailed => 'Gagal';

  @override
  String get statusRejected => 'Tidak dimulakan';

  @override
  String get statusLost => 'Hilang di pelayan';

  @override
  String get selfieTitle => 'Swafoto';

  @override
  String get selfieHint => 'Potret seorang dari depan, muka jelas kelihatan.';

  @override
  String get selfieAnalysing => 'Melihat foto…';

  @override
  String get takePhoto => 'Ambil foto';

  @override
  String get pickGallery => 'Pilih daripada galeri';

  @override
  String get stepKeep => 'Biarkan';

  @override
  String get stepNext => 'Seterusnya';

  @override
  String get hairTitle => 'Rambut';

  @override
  String get beardTitle => 'Janggut';

  @override
  String get glassesTitle => 'Cermin mata';

  @override
  String get glassesFinish => 'Bingkai';

  @override
  String get hairWomen => 'Wanita';

  @override
  String get hairMen => 'Lelaki';

  @override
  String get hairKeepCut => 'Kekalkan potongan, tukar warna sahaja';

  @override
  String get hairColour => 'Warna';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Warna (dalam foto: $colour)';
  }

  @override
  String get hairNoChange => 'Tiada perubahan';

  @override
  String get stylesTitle => 'Gaya';

  @override
  String get frameCount => 'Berapa bingkai';

  @override
  String get mixes => 'Campuran sedia ada';

  @override
  String pickedOf(int picked, int count) {
    return 'Dipilih $picked daripada $count';
  }

  @override
  String get mediumIllustration => 'Lukisan';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Cari gaya';

  @override
  String get pickSomething =>
      'Pilih sekurang-kurangnya satu perubahan atau gaya.';

  @override
  String get startBooth => 'Mulakan photo booth';

  @override
  String get mixGalerie => 'Galeri';

  @override
  String get mixKomiks => 'Pop dan komik';

  @override
  String get mixEpochy => 'Menerusi zaman';

  @override
  String get mixAsie => 'Asia';

  @override
  String get mixCesko => 'Jejak Czech';

  @override
  String get boothTitle => 'Photo booth';

  @override
  String get boothSomeFailed =>
      'Sesetengah bingkai gagal. Penjanaan untuknya telah dikembalikan.';

  @override
  String get layoutGrid => 'Grid';

  @override
  String get layoutStrip => 'Jalur';

  @override
  String get saveToPhotos => 'Simpan ke Foto';

  @override
  String get share => 'Kongsi';

  @override
  String get stripSaved => 'Jalur ada dalam Foto.';

  @override
  String get stripSaveFailed => 'Jalur tidak dapat disimpan ke Foto.';

  @override
  String get nothingReady => 'Belum ada bingkai yang siap.';

  @override
  String get rerun => 'Jalankan semula';

  @override
  String rerunCost(int cost) {
    return 'Jalankan semula ($cost)';
  }

  @override
  String get clipDefaultName => 'Klip';

  @override
  String get clipAnimating => 'Menganimasikan…';

  @override
  String get clipDone => 'Siap';

  @override
  String get clipFailed => 'Gagal. Penjanaan telah dikembalikan.';

  @override
  String get playClip => 'Main klip';

  @override
  String get clipSaved => 'Klip ada dalam Foto.';

  @override
  String get clipSaveFailed => 'Klip tidak dapat disimpan ke Foto.';

  @override
  String get clipCantPlay => 'Klip tidak dapat dimainkan.';

  @override
  String get animate => 'Animasikan';

  @override
  String get motionFast => 'Pantas, dalam beberapa saat';

  @override
  String get motionSlow => 'Perlahan, berpuluh minit';

  @override
  String get tileNewLook => 'Penampilan baharu';

  @override
  String get frameNotReady => 'Bingkai ini belum siap.';

  @override
  String get runNotStarted => 'Render tidak dapat dimulakan.';

  @override
  String get runFailedRefunded => 'Render gagal. Penjanaan telah dikembalikan.';

  @override
  String get runLost =>
      'Pelayan telah dimulakan semula sementara itu dan kehilangan render.';

  @override
  String get errNoFace =>
      'Kami tidak menemui muka. Gunakan potret seorang dari depan.';

  @override
  String get errFaceTooSmall =>
      'Muka terlalu kecil. Pangkas foto lebih dekat dengan kepala dan bahu.';

  @override
  String get errMaskTooSmallHair =>
      'Rambut dalam foto tidak cukup untuk diubah.';

  @override
  String get errMouthNotVisible =>
      'Mulut mesti kelihatan. Pandang ke lensa, tanpa tangan di hadapan muka.';

  @override
  String get errNoBeardToShave => 'Tiada janggut dalam foto untuk dicukur.';

  @override
  String get errEyesNotVisible =>
      'Mata mesti kelihatan. Pandang ke lensa, tanpa tangan atau rambut menutup mata.';

  @override
  String get errMaskTooLarge =>
      'Muka terlalu dekat. Pegang telefon lebih jauh.';

  @override
  String get errNoGlassesToRemove => 'Tiada cermin mata dalam foto.';

  @override
  String get errNothingToChange =>
      'Tiada apa yang boleh diubah dalam foto ini.';

  @override
  String get errBusy =>
      'Render lain sedang berjalan. Sehingga ia selesai, anda tidak boleh memulakan yang baharu atau menganimasikan. Klip “rambut ditiup angin” boleh mengambil masa sekitar 20 minit.';

  @override
  String get errOffline =>
      'Pelayan tidak dapat dihubungi. Semak sambungan anda dan cuba lagi.';

  @override
  String get errAccessDenied =>
      'Pelayan menolak akses. Binaan ini mempunyai token yang salah.';

  @override
  String get errNotFound =>
      'Pelayan sudah tidak mengenali render ini. Mulakan semula.';

  @override
  String get errPlanRejected =>
      'Pelayan menolak pelan. Foto ini tidak dapat dihantar.';

  @override
  String errServer(int status) {
    return 'Pelayan gagal ($status). Cuba lagi sebentar lagi.';
  }

  @override
  String errGeneric(String error) {
    return 'Sesuatu tidak kena: $error';
  }

  @override
  String get photoUnreadable =>
      'Foto tidak dapat dibaca. Gunakan JPEG atau PNG.';

  @override
  String get stageWaitingServer => 'Menunggu pelayan…';

  @override
  String get stageBeard => 'Mengedit janggut…';

  @override
  String get stageGlasses => 'Memakaikan cermin mata…';

  @override
  String get stageHair => 'Memotong rambut…';

  @override
  String get stageQueue => 'Menunggu dalam baris gilir…';

  @override
  String stagePainting(int current, int total) {
    return 'Melukis $current/$total';
  }
}
