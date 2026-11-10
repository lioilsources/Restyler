// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'এই বিল্ডে সার্ভার টোকেন নেই (make run, .env.local)। বিশ্লেষণ কাজ করে, রেন্ডারিং করে না।';

  @override
  String get homeEmpty => 'এখানে এখনও কিছু নেই। একটি সেলফি দিয়ে শুরু করুন।';

  @override
  String get homeNew => 'নতুন ফটো বুথ';

  @override
  String get delete => 'মুছুন';

  @override
  String get statusRunning => 'চলছে';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nটি ফ্রেম',
      one: '$nটি ফ্রেম',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'আংশিক ব্যর্থ';

  @override
  String get statusFailed => 'ব্যর্থ';

  @override
  String get statusRejected => 'শুরু হয়নি';

  @override
  String get statusLost => 'সার্ভারে হারিয়ে গেছে';

  @override
  String get selfieTitle => 'সেলফি';

  @override
  String get selfieHint =>
      'একজন মানুষের সামনে থেকে তোলা পোর্ট্রেট, মুখ স্পষ্ট দেখা যাবে।';

  @override
  String get selfieAnalysing => 'ছবিটি দেখছি…';

  @override
  String get takePhoto => 'ছবি তুলুন';

  @override
  String get pickGallery => 'গ্যালারি থেকে বেছে নিন';

  @override
  String get stepKeep => 'যেমন আছে থাক';

  @override
  String get stepNext => 'পরবর্তী';

  @override
  String get hairTitle => 'চুল';

  @override
  String get beardTitle => 'দাড়ি';

  @override
  String get glassesTitle => 'চশমা';

  @override
  String get glassesFinish => 'ফ্রেম';

  @override
  String get hairWomen => 'নারী';

  @override
  String get hairMen => 'পুরুষ';

  @override
  String get hairKeepCut => 'চুলের কাট রাখুন, শুধু রং বদলান';

  @override
  String get hairColour => 'রং';

  @override
  String hairColourOnPhoto(String colour) {
    return 'রং (ছবিতে: $colour)';
  }

  @override
  String get hairNoChange => 'পরিবর্তন নেই';

  @override
  String get stylesTitle => 'স্টাইল';

  @override
  String get frameCount => 'কতগুলো ফ্রেম';

  @override
  String get mixes => 'তৈরি মিক্স';

  @override
  String pickedOf(int picked, int count) {
    return '$countটির মধ্যে $pickedটি বাছাই করা হয়েছে';
  }

  @override
  String get mediumIllustration => 'চিত্রকর্ম';

  @override
  String get mediumPhoto => 'ছবি';

  @override
  String get searchStyle => 'স্টাইল খুঁজুন';

  @override
  String get pickSomething => 'অন্তত একটি পরিবর্তন বা স্টাইল বেছে নিন।';

  @override
  String get startBooth => 'ফটো বুথ চালু করুন';

  @override
  String get mixGalerie => 'গ্যালারি';

  @override
  String get mixKomiks => 'পপ ও কমিক্স';

  @override
  String get mixEpochy => 'যুগে যুগে';

  @override
  String get mixAsie => 'এশিয়া';

  @override
  String get mixCesko => 'চেক ছাপ';

  @override
  String get boothTitle => 'ফটো বুথ';

  @override
  String get boothSomeFailed =>
      'কিছু ফ্রেম ব্যর্থ হয়েছে। সেগুলোর জেনারেশন ফেরত দেওয়া হয়েছে।';

  @override
  String get layoutGrid => 'গ্রিড';

  @override
  String get layoutStrip => 'স্ট্রিপ';

  @override
  String get saveToPhotos => 'ফটোজে সংরক্ষণ করুন';

  @override
  String get share => 'শেয়ার করুন';

  @override
  String get stripSaved => 'স্ট্রিপ ফটোজে আছে।';

  @override
  String get stripSaveFailed => 'স্ট্রিপ ফটোজে সংরক্ষণ করা যায়নি।';

  @override
  String get nothingReady => 'এখনও কোনো ফ্রেম তৈরি নয়।';

  @override
  String get rerun => 'আবার চালান';

  @override
  String rerunCost(int cost) {
    return 'আবার চালান ($cost)';
  }

  @override
  String get clipDefaultName => 'ক্লিপ';

  @override
  String get clipAnimating => 'অ্যানিমেট করা হচ্ছে…';

  @override
  String get clipDone => 'হয়ে গেছে';

  @override
  String get clipFailed => 'ব্যর্থ হয়েছে। জেনারেশন ফেরত দেওয়া হয়েছে।';

  @override
  String get playClip => 'ক্লিপ চালান';

  @override
  String get clipSaved => 'ক্লিপ ফটোজে আছে।';

  @override
  String get clipSaveFailed => 'ক্লিপ ফটোজে সংরক্ষণ করা যায়নি।';

  @override
  String get clipCantPlay => 'ক্লিপটি চালানো যাচ্ছে না।';

  @override
  String get animate => 'অ্যানিমেট করুন';

  @override
  String get motionFast => 'দ্রুত, কয়েক সেকেন্ডে';

  @override
  String get motionSlow => 'ধীর, কয়েক দশ মিনিট';

  @override
  String get tileNewLook => 'নতুন লুক';

  @override
  String get frameNotReady => 'এই ফ্রেমটি এখনও তৈরি নয়।';

  @override
  String get runNotStarted => 'রেন্ডারিং শুরু করা যায়নি।';

  @override
  String get runFailedRefunded =>
      'রেন্ডারিং ব্যর্থ হয়েছে। জেনারেশন ফেরত দেওয়া হয়েছে।';

  @override
  String get runLost =>
      'এর মধ্যে সার্ভার রিস্টার্ট হয়েছে এবং রেন্ডারিং হারিয়ে গেছে।';

  @override
  String get errNoFace =>
      'কোনো মুখ পাওয়া যায়নি। একজন মানুষের সামনে থেকে তোলা পোর্ট্রেট ব্যবহার করুন।';

  @override
  String get errFaceTooSmall =>
      'মুখ খুব ছোট। ছবিটি মাথা ও কাঁধের আরও কাছ থেকে ক্রপ করুন।';

  @override
  String get errMaskTooSmallHair => 'ছবিতে বদলানোর মতো যথেষ্ট চুল নেই।';

  @override
  String get errMouthNotVisible =>
      'মুখ দেখা যেতে হবে। মুখের সামনে হাত না রেখে লেন্সের দিকে তাকান।';

  @override
  String get errNoBeardToShave => 'ছবিতে কামানোর মতো দাড়ি নেই।';

  @override
  String get errEyesNotVisible =>
      'চোখ দেখা যেতে হবে। চোখের ওপর হাত বা চুল না রেখে লেন্সের দিকে তাকান।';

  @override
  String get errMaskTooLarge => 'মুখ খুব কাছে। ফোনটি আরও দূরে ধরুন।';

  @override
  String get errNoGlassesToRemove => 'ছবিতে চশমা নেই।';

  @override
  String get errNothingToChange => 'এই ছবিতে বদলানোর কিছু নেই।';

  @override
  String get errBusy =>
      'আরেকটি রেন্ডারিং চলছে। সেটি শেষ না হওয়া পর্যন্ত নতুন শুরু করা বা অ্যানিমেট করা যাবে না। “বাতাসে উড়ন্ত চুল” ক্লিপে প্রায় ২০ মিনিট লাগতে পারে।';

  @override
  String get errOffline =>
      'সার্ভারে পৌঁছানো যাচ্ছে না। আপনার সংযোগ পরীক্ষা করে আবার চেষ্টা করুন।';

  @override
  String get errAccessDenied =>
      'সার্ভার অ্যাক্সেস অস্বীকার করেছে। এই বিল্ডের টোকেন ভুল।';

  @override
  String get errNotFound => 'সার্ভার আর এই রেন্ডারিং চেনে না। আবার শুরু করুন।';

  @override
  String get errPlanRejected =>
      'সার্ভার পরিকল্পনা প্রত্যাখ্যান করেছে। এই ছবিটি পাঠানো যাবে না।';

  @override
  String errServer(int status) {
    return 'সার্ভারে সমস্যা হয়েছে ($status)। একটু পরে আবার চেষ্টা করুন।';
  }

  @override
  String errGeneric(String error) {
    return 'কিছু একটা ভুল হয়েছে: $error';
  }

  @override
  String get photoUnreadable => 'ছবিটি পড়া যায়নি। JPEG বা PNG ব্যবহার করুন।';

  @override
  String get stageWaitingServer => 'সার্ভারের জন্য অপেক্ষা করছি…';

  @override
  String get stageBeard => 'দাড়ি ঠিক করা হচ্ছে…';

  @override
  String get stageGlasses => 'চশমা পরানো হচ্ছে…';

  @override
  String get stageHair => 'চুল কাটা হচ্ছে…';

  @override
  String get stageQueue => 'সারিতে অপেক্ষা করছি…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total আঁকা হচ্ছে';
  }
}
