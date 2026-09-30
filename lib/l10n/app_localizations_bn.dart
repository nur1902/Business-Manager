// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'বিজনেস ম্যানেজার';

  @override
  String get welcomeTitle => 'বিজনেস ম্যানেজারে স্বাগতম';

  @override
  String get welcomeSubtitle =>
      'বিক্রয়, ইনভয়েস, স্টক ও হিসাব – সবকিছু এক অ্যাপে সহজে পরিচালনা করুন।';

  @override
  String get continueWithGoogle => 'গুগল দিয়ে চালিয়ে যান';

  @override
  String get signingIn => 'সাইন ইন হচ্ছে...';

  @override
  String get termsNote =>
      'চালিয়ে গেলে আপনি আমাদের শর্তাবলি ও গোপনীয়তা নীতিতে সম্মত হচ্ছেন।';

  @override
  String get dashboard => 'ড্যাশবোর্ড';

  @override
  String get sales => 'বিক্রয়';

  @override
  String get invoices => 'ইনভয়েস';

  @override
  String get products => 'পণ্য';

  @override
  String get customers => 'গ্রাহক';

  @override
  String get more => 'আরও';

  @override
  String welcomeUser(String name) {
    return 'স্বাগতম, $name';
  }

  @override
  String get comingSoon => 'শীঘ্রই আসছে';

  @override
  String get theme => 'থিম';

  @override
  String get themeSystem => 'সিস্টেম';

  @override
  String get themeLight => 'লাইট';

  @override
  String get themeDark => 'ডার্ক';

  @override
  String get language => 'ভাষা';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageBangla => 'বাংলা';

  @override
  String get logout => 'লগআউট';

  @override
  String get logoutConfirmTitle => 'লগআউট করবেন?';

  @override
  String get logoutConfirmMessage =>
      'আপনি যেকোনো সময় আবার সাইন ইন করতে পারবেন।';

  @override
  String get cancel => 'বাতিল';

  @override
  String get errorCancelled => 'সাইন ইন বাতিল করা হয়েছে।';

  @override
  String get errorNoInternet =>
      'ইন্টারনেট সংযোগ নেই। সংযোগ পরীক্ষা করে আবার চেষ্টা করুন।';

  @override
  String get errorInvalidCredential =>
      'সাইন ইন যাচাই করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get errorAccountDisabled => 'এই অ্যাকাউন্টটি নিষ্ক্রিয় করা হয়েছে।';

  @override
  String get errorTooManyRequests =>
      'অনেকবার চেষ্টা করা হয়েছে। কিছুক্ষণ পরে আবার চেষ্টা করুন।';

  @override
  String get errorConfiguration =>
      'গুগল সাইন-ইন সেটআপে সমস্যা আছে। Firebase কনফিগারেশন পরীক্ষা করুন।';

  @override
  String get errorUnknown => 'কিছু একটা ভুল হয়েছে। আবার চেষ্টা করুন।';
}
