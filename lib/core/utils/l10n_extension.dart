import 'package:flutter/widgets.dart';

import '../../l10n/app_localizations.dart';
import 'app_error.dart';

extension L10nContext on BuildContext {
  AppLocalizations? get l10n => AppLocalizations.of(this);
}

/// Converts an [AppErrorType] to a translated message.
String errorMessage(AppLocalizations l10n, AppErrorType type) {
  return switch (type) {
    AppErrorType.cancelled => l10n.errorCancelled,
    AppErrorType.noInternet => l10n.errorNoInternet,
    AppErrorType.invalidCredential => l10n.errorInvalidCredential,
    AppErrorType.accountDisabled => l10n.errorAccountDisabled,
    AppErrorType.tooManyRequests => l10n.errorTooManyRequests,
    AppErrorType.configuration => l10n.errorConfiguration,
    AppErrorType.unknown => l10n.errorUnknown,
  };
}
