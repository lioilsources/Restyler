// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Bu sürümde sunucu belirteci yok (make run, .env.local). Analiz çalışıyor, oluşturma çalışmıyor.';

  @override
  String get homeEmpty => 'Burada henüz bir şey yok. Bir selfie ile başla.';

  @override
  String get homeNew => 'Yeni fotoğraf kabini';

  @override
  String get delete => 'Sil';

  @override
  String get statusRunning => 'Devam ediyor';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kare',
      one: '$n kare',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Bir kısmı başarısız';

  @override
  String get statusFailed => 'Başarısız';

  @override
  String get statusRejected => 'Başlatılmadı';

  @override
  String get statusLost => 'Sunucuda kayboldu';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint => 'Tek kişinin önden portresi, yüz net görünsün.';

  @override
  String get selfieAnalysing => 'Fotoğrafa bakıyorum…';

  @override
  String get takePhoto => 'Fotoğraf çek';

  @override
  String get pickGallery => 'Galeriden seç';

  @override
  String get stepKeep => 'Olduğu gibi bırak';

  @override
  String get stepNext => 'İleri';

  @override
  String get hairTitle => 'Saç';

  @override
  String get beardTitle => 'Sakal';

  @override
  String get glassesTitle => 'Gözlük';

  @override
  String get glassesFinish => 'Çerçeve';

  @override
  String get hairWomen => 'Kadın';

  @override
  String get hairMen => 'Erkek';

  @override
  String get hairKeepCut => 'Saç kesimini koru, sadece rengi değiştir';

  @override
  String get hairColour => 'Renk';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Renk (fotoğrafta: $colour)';
  }

  @override
  String get hairNoChange => 'Değişiklik yok';

  @override
  String get stylesTitle => 'Stiller';

  @override
  String get frameCount => 'Kaç kare';

  @override
  String get mixes => 'Hazır karışımlar';

  @override
  String pickedOf(int picked, int count) {
    return '$count içinden $picked seçildi';
  }

  @override
  String get mediumIllustration => 'Resim';

  @override
  String get mediumPhoto => 'Fotoğraf';

  @override
  String get searchStyle => 'Stil ara';

  @override
  String get pickSomething => 'En az bir düzenleme veya stil seç.';

  @override
  String get startBooth => 'Fotoğraf kabinini başlat';

  @override
  String get mixGalerie => 'Galeri';

  @override
  String get mixKomiks => 'Pop ve çizgi roman';

  @override
  String get mixEpochy => 'Çağlar boyunca';

  @override
  String get mixAsie => 'Asya';

  @override
  String get mixCesko => 'Çek izi';

  @override
  String get boothTitle => 'Fotoğraf kabini';

  @override
  String get boothSomeFailed =>
      'Bazı kareler başarısız oldu. Bunların üretim hakları iade edildi.';

  @override
  String get layoutGrid => 'Izgara';

  @override
  String get layoutStrip => 'Şerit';

  @override
  String get saveToPhotos => 'Fotoğraflar’a kaydet';

  @override
  String get share => 'Paylaş';

  @override
  String get stripSaved => 'Şerit Fotoğraflar’da.';

  @override
  String get stripSaveFailed => 'Şerit Fotoğraflar’a kaydedilemedi.';

  @override
  String get nothingReady => 'Henüz hazır kare yok.';

  @override
  String get rerun => 'Yeniden çalıştır';

  @override
  String rerunCost(int cost) {
    return 'Yeniden çalıştır ($cost)';
  }

  @override
  String get clipDefaultName => 'Klip';

  @override
  String get clipAnimating => 'Canlandırılıyor…';

  @override
  String get clipDone => 'Tamam';

  @override
  String get clipFailed => 'Başarısız oldu. Üretim hakları iade edildi.';

  @override
  String get playClip => 'Klibi oynat';

  @override
  String get clipSaved => 'Klip Fotoğraflar’da.';

  @override
  String get clipSaveFailed => 'Klip Fotoğraflar’a kaydedilemedi.';

  @override
  String get clipCantPlay => 'Klip oynatılamıyor.';

  @override
  String get animate => 'Canlandır';

  @override
  String get motionFast => 'Hızlı, saniyeler içinde';

  @override
  String get motionSlow => 'Yavaş, onlarca dakika';

  @override
  String get tileNewLook => 'Yeni görünüm';

  @override
  String get frameNotReady => 'Bu kare henüz hazır değil.';

  @override
  String get runNotStarted => 'Oluşturma başlatılamadı.';

  @override
  String get runFailedRefunded =>
      'Oluşturma başarısız oldu. Üretim hakları iade edildi.';

  @override
  String get runLost =>
      'Sunucu bu arada yeniden başladı ve oluşturmayı kaybetti.';

  @override
  String get errNoFace => 'Yüz bulamadık. Tek kişinin önden portresini kullan.';

  @override
  String get errFaceTooSmall =>
      'Yüz çok küçük. Fotoğrafı baş ve omuzlara daha yakın kırp.';

  @override
  String get errMaskTooSmallHair => 'Fotoğrafta değiştirilecek kadar saç yok.';

  @override
  String get errMouthNotVisible =>
      'Ağız görünmeli. Yüzünün önünde el olmadan merceğe bak.';

  @override
  String get errNoBeardToShave => 'Fotoğrafta tıraş edilecek sakal yok.';

  @override
  String get errEyesNotVisible =>
      'Gözler görünmeli. Gözlerinin önünde el veya saç olmadan merceğe bak.';

  @override
  String get errMaskTooLarge => 'Yüz çok yakın. Telefonu daha uzak tut.';

  @override
  String get errNoGlassesToRemove => 'Fotoğrafta gözlük yok.';

  @override
  String get errNothingToChange => 'Bu fotoğrafta değiştirilecek bir şey yok.';

  @override
  String get errBusy =>
      'Başka bir oluşturma sürüyor. Bitene kadar yenisini başlatamaz ve canlandıramazsın. “Rüzgârda saç” klibi yaklaşık 20 dakika sürebilir.';

  @override
  String get errOffline =>
      'Sunucuya ulaşılamıyor. Bağlantını kontrol edip tekrar dene.';

  @override
  String get errAccessDenied =>
      'Sunucu erişimi reddetti. Bu sürümün belirteci yanlış.';

  @override
  String get errNotFound =>
      'Sunucu bu oluşturmayı artık bilmiyor. Yeniden başlat.';

  @override
  String get errPlanRejected =>
      'Sunucu planı reddetti. Bu fotoğraf gönderilemez.';

  @override
  String errServer(int status) {
    return 'Sunucu hata verdi ($status). Biraz sonra tekrar dene.';
  }

  @override
  String errGeneric(String error) {
    return 'Bir şeyler ters gitti: $error';
  }

  @override
  String get photoUnreadable => 'Fotoğraf okunamadı. JPEG veya PNG kullan.';

  @override
  String get stageWaitingServer => 'Sunucu bekleniyor…';

  @override
  String get stageBeard => 'Sakal düzenleniyor…';

  @override
  String get stageGlasses => 'Gözlük takılıyor…';

  @override
  String get stageHair => 'Saç kesiliyor…';

  @override
  String get stageQueue => 'Sırada bekleniyor…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total çiziliyor';
  }
}
