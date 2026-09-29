// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Business Manager';

  @override
  String get welcomeTitle => 'Welcome to Business Manager';

  @override
  String get welcomeSubtitle =>
      'Manage sales, invoices, stock and accounts easily, all in one app.';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get termsNote =>
      'By continuing, you agree to our Terms and Privacy Policy.';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get sales => 'Sales';

  @override
  String get invoices => 'Invoices';

  @override
  String get products => 'Products';

  @override
  String get customers => 'Customers';

  @override
  String get more => 'More';

  @override
  String welcomeUser(String name) {
    return 'Welcome, $name';
  }

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageBangla => 'বাংলা';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmTitle => 'Log out?';

  @override
  String get logoutConfirmMessage => 'You can sign in again at any time.';

  @override
  String get cancel => 'Cancel';

  @override
  String get errorCancelled => 'Sign-in was cancelled.';

  @override
  String get errorNoInternet =>
      'No internet connection. Please check your connection and try again.';

  @override
  String get errorInvalidCredential =>
      'We could not verify your sign-in. Please try again.';

  @override
  String get errorAccountDisabled => 'This account has been disabled.';

  @override
  String get errorTooManyRequests =>
      'Too many attempts. Please try again in a few minutes.';

  @override
  String get errorConfiguration =>
      'Google Sign-In is not set up correctly. Please check the Firebase configuration.';

  @override
  String get errorUnknown => 'Something went wrong. Please try again.';
}
