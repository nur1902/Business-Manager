import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/utils/app_error.dart';

/// Talks to Firebase Authentication + Google Sign-In (google_sign_in 7.x API).
/// No UI code and no business logic here.
class AuthService {
  AuthService({FirebaseAuth? auth, GoogleSignIn? googleSignIn})
      : _auth = auth ?? FirebaseAuth.instance,
        _google = googleSignIn ?? GoogleSignIn.instance;

  final FirebaseAuth _auth;
  final GoogleSignIn _google;
  bool _googleInitialized = false;

  Stream<User?> get authStateChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<void> _ensureGoogleInitialized() async {
    if (_googleInitialized) return;
    await _google.initialize();
    _googleInitialized = true;
  }

  /// Google account picker -> Firebase credential -> Firebase user.
  /// Throws [AppException] with a friendly [AppErrorType].
  Future<User> signInWithGoogle() async {
    try {
      await _ensureGoogleInitialized();
      final account = await _google.authenticate();
      final idToken = account.authentication.idToken;
      if (idToken == null) {
        throw const AppException(
          AppErrorType.invalidCredential,
          'Google returned no idToken',
        );
      }
      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final result = await _auth.signInWithCredential(credential);
      final user = result.user;
      if (user == null) {
        throw const AppException(AppErrorType.unknown, 'Firebase user is null');
      }
      return user;
    } on AppException {
      rethrow;
    } on GoogleSignInException catch (e) {
      debugPrint('GoogleSignInException: ${e.code} ${e.description}');
      switch (e.code) {
        case GoogleSignInExceptionCode.canceled:
          throw AppException(AppErrorType.cancelled, e.description);
        case GoogleSignInExceptionCode.clientConfigurationError:
        case GoogleSignInExceptionCode.providerConfigurationError:
          throw AppException(AppErrorType.configuration, e.description);
        default:
          throw AppException(AppErrorType.unknown, e.description);
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code} ${e.message}');
      throw AppException(_mapFirebaseCode(e.code), e.message);
    } catch (e) {
      debugPrint('Unexpected sign-in error: $e');
      throw AppException(AppErrorType.unknown, e.toString());
    }
  }

  AppErrorType _mapFirebaseCode(String code) {
    switch (code) {
      case 'network-request-failed':
        return AppErrorType.noInternet;
      case 'user-disabled':
        return AppErrorType.accountDisabled;
      case 'too-many-requests':
        return AppErrorType.tooManyRequests;
      case 'invalid-credential':
      case 'account-exists-with-different-credential':
      case 'credential-already-in-use':
        return AppErrorType.invalidCredential;
      default:
        return AppErrorType.unknown;
    }
  }

  /// Fresh Firebase ID token. Phase 2 sends this to the PHP API.
  Future<String?> getIdToken({bool forceRefresh = false}) async {
    return _auth.currentUser?.getIdToken(forceRefresh);
  }

  Future<void> signOut() async {
    try {
      await _ensureGoogleInitialized();
      await _google.signOut();
    } catch (e) {
      debugPrint('Google signOut error (ignored): $e');
    }
    await _auth.signOut();
  }
}
