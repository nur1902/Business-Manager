/// Every error the UI can show. The UI maps each type to a translated,
/// human-friendly message, so raw exceptions never reach the user.
enum AppErrorType {
  cancelled,
  noInternet,
  invalidCredential,
  accountDisabled,
  tooManyRequests,
  configuration,
  unknown,
}

class AppException implements Exception {
  const AppException(this.type, [this.debugMessage]);

  final AppErrorType type;

  /// For logs only. Never show this to the user.
  final String? debugMessage;

  @override
  String toString() => 'AppException($type, $debugMessage)';
}
