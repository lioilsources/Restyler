// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Esta versão não tem token do servidor (make run, .env.local). A análise funciona, a renderização não.';

  @override
  String get homeEmpty => 'Ainda não há nada aqui. Comece com uma selfie.';

  @override
  String get homeNew => 'Nova cabine de fotos';

  @override
  String get delete => 'Excluir';

  @override
  String get statusRunning => 'Em andamento';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n quadros',
      one: '$n quadro',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Falha parcial';

  @override
  String get statusFailed => 'Falhou';

  @override
  String get statusRejected => 'Não iniciado';

  @override
  String get statusLost => 'Perdido no servidor';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Retrato frontal de uma só pessoa, com o rosto bem visível.';

  @override
  String get selfieAnalysing => 'Olhando a foto…';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get pickGallery => 'Escolher da galeria';

  @override
  String get stepKeep => 'Manter';

  @override
  String get stepNext => 'Avançar';

  @override
  String get hairTitle => 'Cabelo';

  @override
  String get beardTitle => 'Barba';

  @override
  String get glassesTitle => 'Óculos';

  @override
  String get glassesFinish => 'Armação';

  @override
  String get hairWomen => 'Mulheres';

  @override
  String get hairMen => 'Homens';

  @override
  String get hairKeepCut => 'Manter o corte, mudar só a cor';

  @override
  String get hairColour => 'Cor';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Cor (na foto: $colour)';
  }

  @override
  String get hairNoChange => 'Sem alteração';

  @override
  String get stylesTitle => 'Estilos';

  @override
  String get frameCount => 'Quantos quadros';

  @override
  String get mixes => 'Mixes prontos';

  @override
  String pickedOf(int picked, int count) {
    return 'Selecionados $picked de $count';
  }

  @override
  String get mediumIllustration => 'Pintura';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Buscar estilo';

  @override
  String get pickSomething => 'Escolha pelo menos uma alteração ou um estilo.';

  @override
  String get startBooth => 'Iniciar a cabine de fotos';

  @override
  String get mixGalerie => 'Galeria';

  @override
  String get mixKomiks => 'Pop e quadrinhos';

  @override
  String get mixEpochy => 'Através das épocas';

  @override
  String get mixAsie => 'Ásia';

  @override
  String get mixCesko => 'Trilha tcheca';

  @override
  String get boothTitle => 'Cabine de fotos';

  @override
  String get boothSomeFailed =>
      'Alguns quadros falharam. As gerações deles foram devolvidas.';

  @override
  String get layoutGrid => 'Grade';

  @override
  String get layoutStrip => 'Tira';

  @override
  String get saveToPhotos => 'Salvar em Fotos';

  @override
  String get share => 'Compartilhar';

  @override
  String get stripSaved => 'A tira está em Fotos.';

  @override
  String get stripSaveFailed => 'Não foi possível salvar a tira em Fotos.';

  @override
  String get nothingReady => 'Nenhum quadro está pronto ainda.';

  @override
  String get rerun => 'Executar de novo';

  @override
  String rerunCost(int cost) {
    return 'Executar de novo ($cost)';
  }

  @override
  String get clipDefaultName => 'Clipe';

  @override
  String get clipAnimating => 'Animando…';

  @override
  String get clipDone => 'Pronto';

  @override
  String get clipFailed => 'Falhou. As gerações foram devolvidas.';

  @override
  String get playClip => 'Reproduzir clipe';

  @override
  String get clipSaved => 'O clipe está em Fotos.';

  @override
  String get clipSaveFailed => 'Não foi possível salvar o clipe em Fotos.';

  @override
  String get clipCantPlay => 'Não é possível reproduzir o clipe.';

  @override
  String get animate => 'Animar';

  @override
  String get motionFast => 'Rápido, em segundos';

  @override
  String get motionSlow => 'Lento, dezenas de minutos';

  @override
  String get tileNewLook => 'Novo visual';

  @override
  String get frameNotReady => 'Este quadro ainda não está pronto.';

  @override
  String get runNotStarted => 'Não foi possível iniciar a renderização.';

  @override
  String get runFailedRefunded =>
      'A renderização falhou. As gerações foram devolvidas.';

  @override
  String get runLost =>
      'O servidor reiniciou nesse meio-tempo e perdeu a renderização.';

  @override
  String get errNoFace =>
      'Não encontramos um rosto. Use um retrato frontal de uma só pessoa.';

  @override
  String get errFaceTooSmall =>
      'O rosto está pequeno demais. Corte a foto mais perto da cabeça e dos ombros.';

  @override
  String get errMaskTooSmallHair =>
      'Não há cabelo suficiente na foto para mudar.';

  @override
  String get errMouthNotVisible =>
      'A boca precisa estar visível. Olhe para a lente, sem a mão na frente do rosto.';

  @override
  String get errNoBeardToShave => 'Não há barba na foto para raspar.';

  @override
  String get errEyesNotVisible =>
      'Os olhos precisam estar visíveis. Olhe para a lente, sem mão nem cabelo sobre os olhos.';

  @override
  String get errMaskTooLarge =>
      'O rosto está perto demais. Segure o celular mais longe.';

  @override
  String get errNoGlassesToRemove => 'Não há óculos na foto.';

  @override
  String get errNothingToChange => 'Não há nada para mudar nesta foto.';

  @override
  String get errBusy =>
      'Outra renderização está em andamento. Até ela terminar, você não pode iniciar outra nem animar. O clipe “cabelo ao vento” pode levar cerca de 20 minutos.';

  @override
  String get errOffline =>
      'O servidor está inacessível. Verifique a conexão e tente de novo.';

  @override
  String get errAccessDenied =>
      'O servidor recusou o acesso. Esta versão tem o token errado.';

  @override
  String get errNotFound =>
      'O servidor não conhece mais esta renderização. Inicie-a de novo.';

  @override
  String get errPlanRejected =>
      'O servidor recusou o plano. Esta foto não pode ser enviada.';

  @override
  String errServer(int status) {
    return 'O servidor falhou ($status). Tente de novo daqui a pouco.';
  }

  @override
  String errGeneric(String error) {
    return 'Algo deu errado: $error';
  }

  @override
  String get photoUnreadable => 'Não foi possível ler a foto. Use JPEG ou PNG.';

  @override
  String get stageWaitingServer => 'Aguardando o servidor…';

  @override
  String get stageBeard => 'Ajustando a barba…';

  @override
  String get stageGlasses => 'Colocando os óculos…';

  @override
  String get stageHair => 'Cortando o cabelo…';

  @override
  String get stageQueue => 'Esperando na fila…';

  @override
  String stagePainting(int current, int total) {
    return 'Pintando $current/$total';
  }
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Esta versão não tem token do servidor (make run, .env.local). A análise funciona, a renderização não.';

  @override
  String get homeEmpty => 'Ainda não há nada aqui. Comece com uma selfie.';

  @override
  String get homeNew => 'Nova cabine de fotos';

  @override
  String get delete => 'Excluir';

  @override
  String get statusRunning => 'Em andamento';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n quadros',
      one: '$n quadro',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Falha parcial';

  @override
  String get statusFailed => 'Falhou';

  @override
  String get statusRejected => 'Não iniciado';

  @override
  String get statusLost => 'Perdido no servidor';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Retrato frontal de uma só pessoa, com o rosto bem visível.';

  @override
  String get selfieAnalysing => 'Olhando a foto…';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get pickGallery => 'Escolher da galeria';

  @override
  String get stepKeep => 'Manter';

  @override
  String get stepNext => 'Avançar';

  @override
  String get hairTitle => 'Cabelo';

  @override
  String get beardTitle => 'Barba';

  @override
  String get glassesTitle => 'Óculos';

  @override
  String get glassesFinish => 'Armação';

  @override
  String get hairWomen => 'Mulheres';

  @override
  String get hairMen => 'Homens';

  @override
  String get hairKeepCut => 'Manter o corte, mudar só a cor';

  @override
  String get hairColour => 'Cor';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Cor (na foto: $colour)';
  }

  @override
  String get hairNoChange => 'Sem alteração';

  @override
  String get stylesTitle => 'Estilos';

  @override
  String get frameCount => 'Quantos quadros';

  @override
  String get mixes => 'Mixes prontos';

  @override
  String pickedOf(int picked, int count) {
    return 'Selecionados $picked de $count';
  }

  @override
  String get mediumIllustration => 'Pintura';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Buscar estilo';

  @override
  String get pickSomething => 'Escolha pelo menos uma alteração ou um estilo.';

  @override
  String get startBooth => 'Iniciar a cabine de fotos';

  @override
  String get mixGalerie => 'Galeria';

  @override
  String get mixKomiks => 'Pop e quadrinhos';

  @override
  String get mixEpochy => 'Através das épocas';

  @override
  String get mixAsie => 'Ásia';

  @override
  String get mixCesko => 'Trilha tcheca';

  @override
  String get boothTitle => 'Cabine de fotos';

  @override
  String get boothSomeFailed =>
      'Alguns quadros falharam. As gerações deles foram devolvidas.';

  @override
  String get layoutGrid => 'Grade';

  @override
  String get layoutStrip => 'Tira';

  @override
  String get saveToPhotos => 'Salvar em Fotos';

  @override
  String get share => 'Compartilhar';

  @override
  String get stripSaved => 'A tira está em Fotos.';

  @override
  String get stripSaveFailed => 'Não foi possível salvar a tira em Fotos.';

  @override
  String get nothingReady => 'Nenhum quadro está pronto ainda.';

  @override
  String get rerun => 'Executar de novo';

  @override
  String rerunCost(int cost) {
    return 'Executar de novo ($cost)';
  }

  @override
  String get clipDefaultName => 'Clipe';

  @override
  String get clipAnimating => 'Animando…';

  @override
  String get clipDone => 'Pronto';

  @override
  String get clipFailed => 'Falhou. As gerações foram devolvidas.';

  @override
  String get playClip => 'Reproduzir clipe';

  @override
  String get clipSaved => 'O clipe está em Fotos.';

  @override
  String get clipSaveFailed => 'Não foi possível salvar o clipe em Fotos.';

  @override
  String get clipCantPlay => 'Não é possível reproduzir o clipe.';

  @override
  String get animate => 'Animar';

  @override
  String get motionFast => 'Rápido, em segundos';

  @override
  String get motionSlow => 'Lento, dezenas de minutos';

  @override
  String get tileNewLook => 'Novo visual';

  @override
  String get frameNotReady => 'Este quadro ainda não está pronto.';

  @override
  String get runNotStarted => 'Não foi possível iniciar a renderização.';

  @override
  String get runFailedRefunded =>
      'A renderização falhou. As gerações foram devolvidas.';

  @override
  String get runLost =>
      'O servidor reiniciou nesse meio-tempo e perdeu a renderização.';

  @override
  String get errNoFace =>
      'Não encontramos um rosto. Use um retrato frontal de uma só pessoa.';

  @override
  String get errFaceTooSmall =>
      'O rosto está pequeno demais. Corte a foto mais perto da cabeça e dos ombros.';

  @override
  String get errMaskTooSmallHair =>
      'Não há cabelo suficiente na foto para mudar.';

  @override
  String get errMouthNotVisible =>
      'A boca precisa estar visível. Olhe para a lente, sem a mão na frente do rosto.';

  @override
  String get errNoBeardToShave => 'Não há barba na foto para raspar.';

  @override
  String get errEyesNotVisible =>
      'Os olhos precisam estar visíveis. Olhe para a lente, sem mão nem cabelo sobre os olhos.';

  @override
  String get errMaskTooLarge =>
      'O rosto está perto demais. Segure o celular mais longe.';

  @override
  String get errNoGlassesToRemove => 'Não há óculos na foto.';

  @override
  String get errNothingToChange => 'Não há nada para mudar nesta foto.';

  @override
  String get errBusy =>
      'Outra renderização está em andamento. Até ela terminar, você não pode iniciar outra nem animar. O clipe “cabelo ao vento” pode levar cerca de 20 minutos.';

  @override
  String get errOffline =>
      'O servidor está inacessível. Verifique a conexão e tente de novo.';

  @override
  String get errAccessDenied =>
      'O servidor recusou o acesso. Esta versão tem o token errado.';

  @override
  String get errNotFound =>
      'O servidor não conhece mais esta renderização. Inicie-a de novo.';

  @override
  String get errPlanRejected =>
      'O servidor recusou o plano. Esta foto não pode ser enviada.';

  @override
  String errServer(int status) {
    return 'O servidor falhou ($status). Tente de novo daqui a pouco.';
  }

  @override
  String errGeneric(String error) {
    return 'Algo deu errado: $error';
  }

  @override
  String get photoUnreadable => 'Não foi possível ler a foto. Use JPEG ou PNG.';

  @override
  String get stageWaitingServer => 'Aguardando o servidor…';

  @override
  String get stageBeard => 'Ajustando a barba…';

  @override
  String get stageGlasses => 'Colocando os óculos…';

  @override
  String get stageHair => 'Cortando o cabelo…';

  @override
  String get stageQueue => 'Esperando na fila…';

  @override
  String stagePainting(int current, int total) {
    return 'Pintando $current/$total';
  }
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Esta versão não tem token do servidor (make run, .env.local). A análise funciona, a renderização não.';

  @override
  String get homeEmpty => 'Ainda não há nada aqui. Começa com uma selfie.';

  @override
  String get homeNew => 'Nova cabine fotográfica';

  @override
  String get delete => 'Eliminar';

  @override
  String get statusRunning => 'Em curso';

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
  String get statusPartial => 'Falha parcial';

  @override
  String get statusFailed => 'Falhou';

  @override
  String get statusRejected => 'Não iniciado';

  @override
  String get statusLost => 'Perdido no servidor';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Retrato frontal de uma só pessoa, com o rosto bem visível.';

  @override
  String get selfieAnalysing => 'A ver a fotografia…';

  @override
  String get takePhoto => 'Tirar uma fotografia';

  @override
  String get pickGallery => 'Escolher da galeria';

  @override
  String get stepKeep => 'Manter';

  @override
  String get stepNext => 'Seguinte';

  @override
  String get hairTitle => 'Cabelo';

  @override
  String get beardTitle => 'Barba';

  @override
  String get glassesTitle => 'Óculos';

  @override
  String get glassesFinish => 'Armação';

  @override
  String get hairWomen => 'Mulheres';

  @override
  String get hairMen => 'Homens';

  @override
  String get hairKeepCut => 'Manter o corte, mudar só a cor';

  @override
  String get hairColour => 'Cor';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Cor (na fotografia: $colour)';
  }

  @override
  String get hairNoChange => 'Sem alteração';

  @override
  String get stylesTitle => 'Estilos';

  @override
  String get frameCount => 'Quantos fotogramas';

  @override
  String get mixes => 'Misturas prontas';

  @override
  String pickedOf(int picked, int count) {
    return 'Selecionados $picked de $count';
  }

  @override
  String get mediumIllustration => 'Pintura';

  @override
  String get mediumPhoto => 'Fotografia';

  @override
  String get searchStyle => 'Procurar estilo';

  @override
  String get pickSomething => 'Escolhe pelo menos uma alteração ou um estilo.';

  @override
  String get startBooth => 'Iniciar a cabine fotográfica';

  @override
  String get mixGalerie => 'Galeria';

  @override
  String get mixKomiks => 'Pop e banda desenhada';

  @override
  String get mixEpochy => 'Através das épocas';

  @override
  String get mixAsie => 'Ásia';

  @override
  String get mixCesko => 'Rasto checo';

  @override
  String get boothTitle => 'Cabine fotográfica';

  @override
  String get boothSomeFailed =>
      'Alguns fotogramas falharam. As gerações desses fotogramas foram devolvidas.';

  @override
  String get layoutGrid => 'Grelha';

  @override
  String get layoutStrip => 'Tira';

  @override
  String get saveToPhotos => 'Guardar em Fotografias';

  @override
  String get share => 'Partilhar';

  @override
  String get stripSaved => 'A tira está em Fotografias.';

  @override
  String get stripSaveFailed =>
      'Não foi possível guardar a tira em Fotografias.';

  @override
  String get nothingReady => 'Ainda não há nenhum fotograma pronto.';

  @override
  String get rerun => 'Executar de novo';

  @override
  String rerunCost(int cost) {
    return 'Executar de novo ($cost)';
  }

  @override
  String get clipDefaultName => 'Clipe';

  @override
  String get clipAnimating => 'A animar…';

  @override
  String get clipDone => 'Concluído';

  @override
  String get clipFailed => 'Falhou. As gerações foram devolvidas.';

  @override
  String get playClip => 'Reproduzir clipe';

  @override
  String get clipSaved => 'O clipe está em Fotografias.';

  @override
  String get clipSaveFailed =>
      'Não foi possível guardar o clipe em Fotografias.';

  @override
  String get clipCantPlay => 'Não é possível reproduzir o clipe.';

  @override
  String get animate => 'Animar';

  @override
  String get motionFast => 'Rápido, em segundos';

  @override
  String get motionSlow => 'Lento, dezenas de minutos';

  @override
  String get tileNewLook => 'Novo visual';

  @override
  String get frameNotReady => 'Este fotograma ainda não está pronto.';

  @override
  String get runNotStarted => 'Não foi possível iniciar a renderização.';

  @override
  String get runFailedRefunded =>
      'A renderização falhou. As gerações foram devolvidas.';

  @override
  String get runLost =>
      'Entretanto o servidor reiniciou e perdeu a renderização.';

  @override
  String get errNoFace =>
      'Não encontrámos um rosto. Usa um retrato frontal de uma só pessoa.';

  @override
  String get errFaceTooSmall =>
      'O rosto é demasiado pequeno. Recorta a fotografia mais perto da cabeça e dos ombros.';

  @override
  String get errMaskTooSmallHair =>
      'Não há cabelo suficiente na fotografia para alterar.';

  @override
  String get errMouthNotVisible =>
      'A boca tem de estar visível. Olha para a objetiva, sem a mão à frente do rosto.';

  @override
  String get errNoBeardToShave => 'Não há barba na fotografia para rapar.';

  @override
  String get errEyesNotVisible =>
      'Os olhos têm de estar visíveis. Olha para a objetiva, sem mão nem cabelo sobre os olhos.';

  @override
  String get errMaskTooLarge =>
      'O rosto está demasiado perto. Segura o telemóvel mais longe.';

  @override
  String get errNoGlassesToRemove => 'Não há óculos na fotografia.';

  @override
  String get errNothingToChange => 'Não há nada para alterar nesta fotografia.';

  @override
  String get errBusy =>
      'Está a decorrer outra renderização. Enquanto não terminar, não podes iniciar outra nem animar. O clipe «cabelo ao vento» pode demorar cerca de 20 minutos.';

  @override
  String get errOffline =>
      'O servidor não está acessível. Verifica a ligação e tenta de novo.';

  @override
  String get errAccessDenied =>
      'O servidor recusou o acesso. Esta versão tem o token errado.';

  @override
  String get errNotFound =>
      'O servidor já não conhece esta renderização. Inicia-a de novo.';

  @override
  String get errPlanRejected =>
      'O servidor recusou o plano. Esta fotografia não pode ser enviada.';

  @override
  String errServer(int status) {
    return 'O servidor falhou ($status). Tenta de novo daqui a pouco.';
  }

  @override
  String errGeneric(String error) {
    return 'Algo correu mal: $error';
  }

  @override
  String get photoUnreadable =>
      'Não foi possível ler a fotografia. Usa JPEG ou PNG.';

  @override
  String get stageWaitingServer => 'A aguardar o servidor…';

  @override
  String get stageBeard => 'A ajustar a barba…';

  @override
  String get stageGlasses => 'A colocar os óculos…';

  @override
  String get stageHair => 'A cortar o cabelo…';

  @override
  String get stageQueue => 'A aguardar na fila…';

  @override
  String stagePainting(int current, int total) {
    return 'A pintar $current/$total';
  }
}
