import 'dart:async';

import 'package:buisness_manager/services/api/api_caller.dart';
import 'package:buisness_manager/services/database/database_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../core/utils/app_error.dart';
import '../services/firebase/auth_service.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

/// Holds the login state for the whole app. The router listens to it.
class AuthProvider extends ChangeNotifier {


  AuthProvider(this._service) {


    _user = _service.currentUser;
    _sub = _service.authStateChanges.listen(_onAuthChanged);
  }



  final AuthService _service;
  StreamSubscription<User?>? _sub;

  AuthStatus _status = AuthStatus.unknown;
  User? _user;
  bool _isSigningIn = false;

  AuthStatus get status => _status;
  User? get user => _user;
  bool get isSigningIn => _isSigningIn;

  void _onAuthChanged(User? user) {
    _user = user;
    _status =
        user == null ? AuthStatus.unauthenticated : AuthStatus.authenticated;
    // Phase 2: call the PHP API here (sync_user.php) to create/update the MySQL user.
    notifyListeners();
  }

  /// Returns an error type to show, or null on success / when the user cancelled.
  Future<AppErrorType?> signInWithGoogle() async {
    if (_isSigningIn) return null;
    _isSigningIn = true;
    notifyListeners();
    try {
      await _service.signInWithGoogle();
      print(user!.displayName);
      ApiCaller.pushRequest("${DatabasePaths.usertable}?email=${user?.email}&firebase_uid=${user?.uid}");


      return null;
    } on AppException catch (e) {
      return e.type == AppErrorType.cancelled ? null : e.type;
    } finally {
      _isSigningIn = false;
      notifyListeners();
    }

  }


  Future<void> signOut() => _service.signOut();

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
