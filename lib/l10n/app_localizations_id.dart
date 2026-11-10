// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Build ini tidak memiliki token server (make run, .env.local). Analisis berfungsi, render tidak.';

  @override
  String get homeEmpty => 'Belum ada apa pun di sini. Mulai dengan selfie.';

  @override
  String get homeNew => 'Photo booth baru';

  @override
  String get delete => 'Hapus';

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
  String get statusPartial => 'Sebagian gagal';

  @override
  String get statusFailed => 'Gagal';

  @override
  String get statusRejected => 'Tidak dimulai';

  @override
  String get statusLost => 'Hilang di server';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Potret satu orang dari depan, wajah terlihat jelas.';

  @override
  String get selfieAnalysing => 'Melihat foto…';

  @override
  String get takePhoto => 'Ambil foto';

  @override
  String get pickGallery => 'Pilih dari galeri';

  @override
  String get stepKeep => 'Biarkan';

  @override
  String get stepNext => 'Lanjut';

  @override
  String get hairTitle => 'Rambut';

  @override
  String get beardTitle => 'Jenggot';

  @override
  String get glassesTitle => 'Kacamata';

  @override
  String get glassesFinish => 'Bingkai';

  @override
  String get hairWomen => 'Wanita';

  @override
  String get hairMen => 'Pria';

  @override
  String get hairKeepCut => 'Pertahankan potongan, ganti warna saja';

  @override
  String get hairColour => 'Warna';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Warna (di foto: $colour)';
  }

  @override
  String get hairNoChange => 'Tanpa perubahan';

  @override
  String get stylesTitle => 'Gaya';

  @override
  String get frameCount => 'Berapa bingkai';

  @override
  String get mixes => 'Mix siap pakai';

  @override
  String pickedOf(int picked, int count) {
    return 'Dipilih $picked dari $count';
  }

  @override
  String get mediumIllustration => 'Lukisan';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Cari gaya';

  @override
  String get pickSomething => 'Pilih setidaknya satu perubahan atau gaya.';

  @override
  String get startBooth => 'Mulai photo booth';

  @override
  String get mixGalerie => 'Galeri';

  @override
  String get mixKomiks => 'Pop dan komik';

  @override
  String get mixEpochy => 'Menembus zaman';

  @override
  String get mixAsie => 'Asia';

  @override
  String get mixCesko => 'Jejak Ceko';

  @override
  String get boothTitle => 'Photo booth';

  @override
  String get boothSomeFailed =>
      'Beberapa bingkai gagal. Generasi untuk bingkai itu sudah dikembalikan.';

  @override
  String get layoutGrid => 'Kisi';

  @override
  String get layoutStrip => 'Strip';

  @override
  String get saveToPhotos => 'Simpan ke Foto';

  @override
  String get share => 'Bagikan';

  @override
  String get stripSaved => 'Strip ada di Foto.';

  @override
  String get stripSaveFailed => 'Strip tidak dapat disimpan ke Foto.';

  @override
  String get nothingReady => 'Belum ada bingkai yang siap.';

  @override
  String get rerun => 'Jalankan lagi';

  @override
  String rerunCost(int cost) {
    return 'Jalankan lagi ($cost)';
  }

  @override
  String get clipDefaultName => 'Klip';

  @override
  String get clipAnimating => 'Menganimasikan…';

  @override
  String get clipDone => 'Selesai';

  @override
  String get clipFailed => 'Gagal. Generasi sudah dikembalikan.';

  @override
  String get playClip => 'Putar klip';

  @override
  String get clipSaved => 'Klip ada di Foto.';

  @override
  String get clipSaveFailed => 'Klip tidak dapat disimpan ke Foto.';

  @override
  String get clipCantPlay => 'Klip tidak dapat diputar.';

  @override
  String get animate => 'Animasikan';

  @override
  String get motionFast => 'Cepat, dalam hitungan detik';

  @override
  String get motionSlow => 'Lambat, puluhan menit';

  @override
  String get tileNewLook => 'Tampilan baru';

  @override
  String get frameNotReady => 'Bingkai ini belum siap.';

  @override
  String get runNotStarted => 'Render tidak dapat dimulai.';

  @override
  String get runFailedRefunded => 'Render gagal. Generasi sudah dikembalikan.';

  @override
  String get runLost => 'Server sempat dimulai ulang dan kehilangan render.';

  @override
  String get errNoFace =>
      'Kami tidak menemukan wajah. Gunakan potret satu orang dari depan.';

  @override
  String get errFaceTooSmall =>
      'Wajah terlalu kecil. Pangkas foto lebih dekat ke kepala dan bahu.';

  @override
  String get errMaskTooSmallHair => 'Rambut di foto tidak cukup untuk diubah.';

  @override
  String get errMouthNotVisible =>
      'Mulut harus terlihat. Lihat ke lensa, tanpa tangan di depan wajah.';

  @override
  String get errNoBeardToShave => 'Tidak ada jenggot di foto untuk dicukur.';

  @override
  String get errEyesNotVisible =>
      'Mata harus terlihat. Lihat ke lensa, tanpa tangan atau rambut menutupi mata.';

  @override
  String get errMaskTooLarge =>
      'Wajah terlalu dekat. Pegang ponsel lebih jauh.';

  @override
  String get errNoGlassesToRemove => 'Tidak ada kacamata di foto.';

  @override
  String get errNothingToChange => 'Tidak ada yang bisa diubah di foto ini.';

  @override
  String get errBusy =>
      'Render lain sedang berjalan. Sampai selesai, kamu tidak bisa memulai yang baru atau menganimasikan. Klip “rambut tertiup angin” bisa memakan waktu sekitar 20 menit.';

  @override
  String get errOffline =>
      'Server tidak dapat dijangkau. Periksa koneksimu dan coba lagi.';

  @override
  String get errAccessDenied =>
      'Server menolak akses. Build ini memiliki token yang salah.';

  @override
  String get errNotFound =>
      'Server tidak lagi mengenali render ini. Mulai lagi.';

  @override
  String get errPlanRejected =>
      'Server menolak rencana. Foto ini tidak dapat dikirim.';

  @override
  String errServer(int status) {
    return 'Server gagal ($status). Coba lagi sebentar lagi.';
  }

  @override
  String errGeneric(String error) {
    return 'Terjadi kesalahan: $error';
  }

  @override
  String get photoUnreadable =>
      'Foto tidak dapat dibaca. Gunakan JPEG atau PNG.';

  @override
  String get stageWaitingServer => 'Menunggu server…';

  @override
  String get stageBeard => 'Mengedit jenggot…';

  @override
  String get stageGlasses => 'Memasang kacamata…';

  @override
  String get stageHair => 'Memotong rambut…';

  @override
  String get stageQueue => 'Menunggu dalam antrean…';

  @override
  String stagePainting(int current, int total) {
    return 'Melukis $current/$total';
  }
}
