// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Esta versión no tiene token de servidor (make run, .env.local). El análisis funciona, el renderizado no.';

  @override
  String get homeEmpty => 'Aún no hay nada. Empieza con un selfie.';

  @override
  String get homeNew => 'Nuevo fotomatón';

  @override
  String get delete => 'Eliminar';

  @override
  String get statusRunning => 'En curso';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n fotogramas',
      one: '$n fotograma',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Fallo parcial';

  @override
  String get statusFailed => 'Falló';

  @override
  String get statusRejected => 'No iniciado';

  @override
  String get statusLost => 'Perdido en el servidor';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Retrato frontal de una sola persona, con la cara bien visible.';

  @override
  String get selfieAnalysing => 'Examinando la foto…';

  @override
  String get takePhoto => 'Hacer una foto';

  @override
  String get pickGallery => 'Elegir de la galería';

  @override
  String get stepKeep => 'Mantener';

  @override
  String get stepNext => 'Siguiente';

  @override
  String get hairTitle => 'Pelo';

  @override
  String get beardTitle => 'Barba';

  @override
  String get glassesTitle => 'Gafas';

  @override
  String get glassesFinish => 'Montura';

  @override
  String get hairWomen => 'Mujeres';

  @override
  String get hairMen => 'Hombres';

  @override
  String get hairKeepCut => 'Mantener el corte, cambiar solo el color';

  @override
  String get hairColour => 'Color';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Color (en la foto: $colour)';
  }

  @override
  String get hairNoChange => 'Sin cambios';

  @override
  String get stylesTitle => 'Estilos';

  @override
  String get frameCount => 'Cuántos fotogramas';

  @override
  String get mixes => 'Mezclas listas';

  @override
  String pickedOf(int picked, int count) {
    return 'Seleccionados $picked de $count';
  }

  @override
  String get mediumIllustration => 'Pintura';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Buscar estilo';

  @override
  String get pickSomething => 'Elige al menos un cambio o un estilo.';

  @override
  String get startBooth => 'Iniciar el fotomatón';

  @override
  String get mixGalerie => 'Galería';

  @override
  String get mixKomiks => 'Pop y cómic';

  @override
  String get mixEpochy => 'A través de las épocas';

  @override
  String get mixAsie => 'Asia';

  @override
  String get mixCesko => 'Huella checa';

  @override
  String get boothTitle => 'Fotomatón';

  @override
  String get boothSomeFailed =>
      'Algunos fotogramas fallaron. Las generaciones de esos fotogramas se han devuelto.';

  @override
  String get layoutGrid => 'Cuadrícula';

  @override
  String get layoutStrip => 'Tira';

  @override
  String get saveToPhotos => 'Guardar en Fotos';

  @override
  String get share => 'Compartir';

  @override
  String get stripSaved => 'La tira está en Fotos.';

  @override
  String get stripSaveFailed => 'No se pudo guardar la tira en Fotos.';

  @override
  String get nothingReady => 'Todavía no hay ningún fotograma listo.';

  @override
  String get rerun => 'Ejecutar de nuevo';

  @override
  String rerunCost(int cost) {
    return 'Ejecutar de nuevo ($cost)';
  }

  @override
  String get clipDefaultName => 'Clip';

  @override
  String get clipAnimating => 'Animando…';

  @override
  String get clipDone => 'Listo';

  @override
  String get clipFailed => 'Falló. Las generaciones se han devuelto.';

  @override
  String get playClip => 'Reproducir clip';

  @override
  String get clipSaved => 'El clip está en Fotos.';

  @override
  String get clipSaveFailed => 'No se pudo guardar el clip en Fotos.';

  @override
  String get clipCantPlay => 'No se puede reproducir el clip.';

  @override
  String get animate => 'Animar';

  @override
  String get motionFast => 'Rápido, en segundos';

  @override
  String get motionSlow => 'Lento, decenas de minutos';

  @override
  String get tileNewLook => 'Nuevo look';

  @override
  String get frameNotReady => 'Este fotograma aún no está listo.';

  @override
  String get runNotStarted => 'No se pudo iniciar el renderizado.';

  @override
  String get runFailedRefunded =>
      'El renderizado falló. Las generaciones se han devuelto.';

  @override
  String get runLost =>
      'El servidor se reinició entretanto y perdió el renderizado.';

  @override
  String get errNoFace =>
      'No encontramos ninguna cara. Usa un retrato frontal de una sola persona.';

  @override
  String get errFaceTooSmall =>
      'La cara es demasiado pequeña. Recorta la foto más cerca de la cabeza y los hombros.';

  @override
  String get errMaskTooSmallHair =>
      'No hay suficiente pelo en la foto para cambiarlo.';

  @override
  String get errMouthNotVisible =>
      'La boca debe verse. Mira al objetivo, sin la mano delante de la cara.';

  @override
  String get errNoBeardToShave => 'No hay barba que afeitar en la foto.';

  @override
  String get errEyesNotVisible =>
      'Los ojos deben verse. Mira al objetivo, sin la mano ni el pelo sobre los ojos.';

  @override
  String get errMaskTooLarge =>
      'La cara está demasiado cerca. Sujeta el teléfono más lejos.';

  @override
  String get errNoGlassesToRemove => 'No hay gafas en la foto.';

  @override
  String get errNothingToChange => 'No hay nada que cambiar en esta foto.';

  @override
  String get errBusy =>
      'Hay otro renderizado en curso. Hasta que termine no puedes iniciar uno nuevo ni animar. El clip «pelo al viento» puede tardar unos 20 minutos.';

  @override
  String get errOffline =>
      'No se puede acceder al servidor. Comprueba tu conexión e inténtalo de nuevo.';

  @override
  String get errAccessDenied =>
      'El servidor rechazó el acceso. Esta versión tiene un token incorrecto.';

  @override
  String get errNotFound =>
      'El servidor ya no conoce este renderizado. Vuelve a iniciarlo.';

  @override
  String get errPlanRejected =>
      'El servidor rechazó el plan. Esta foto no se puede enviar.';

  @override
  String errServer(int status) {
    return 'El servidor falló ($status). Inténtalo de nuevo en un momento.';
  }

  @override
  String errGeneric(String error) {
    return 'Algo salió mal: $error';
  }

  @override
  String get photoUnreadable => 'No se pudo leer la foto. Usa JPEG o PNG.';

  @override
  String get stageWaitingServer => 'Esperando al servidor…';

  @override
  String get stageBeard => 'Retocando la barba…';

  @override
  String get stageGlasses => 'Poniendo las gafas…';

  @override
  String get stageHair => 'Cortando el pelo…';

  @override
  String get stageQueue => 'Esperando en la cola…';

  @override
  String stagePainting(int current, int total) {
    return 'Pintando $current/$total';
  }
}
