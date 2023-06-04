
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_source/auth_data_source.dart';

class AuthNotifier extends StateNotifier<AuthenticationState> {
  // dataSource di assign nilainya ke initial , sepertinya
  AuthNotifier(this._dataSource) : super(const AuthenticationState.initial());

  final AuthDataSource _dataSource;

  Future<void> login({required String email, required String password}) async {
    state = const AuthenticationState.loading();
    final response = await _dataSource.login(email: email, password: password);
    state = response
        .fold((error) => AuthenticationState.unauthenticated(message: error),
            (response) {
      return response.fold((authNotVerify) {
        print("test");
        return AuthenticationState.notVerify(user: authNotVerify!);
      }, (authVerify) {
        print("TEST");
        return AuthenticationState.authenticated(user: authVerify!);
      });
    });
  }

  Future<void> saveDataUser(
      {required User user,
      String? filePath,
      String? firstname,
      String? lastname,
      String? photoURL,
      String? role}) async {
    state = const AuthenticationState.loading();
    final response = await _dataSource.saveUser(user: user);
    state = response.fold(
      (error) => AuthenticationState.failed(message: error),
      (response) => AuthenticationState.success(message: response),
    );
  }

  Future<void> signup(
      {required String email,
      required String password,
      required String nama,
      required String phone,
      String? namaUsaha,
      String? referral,
      required String role,
      String? filePath}) async {
    state = const AuthenticationState.loading();
    final response = await _dataSource.signup(
        email: email,
        password: password,
        nama: nama,
        phone: phone,
        filePath: filePath,
        namaUsaha: namaUsaha,
        role: role);
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.notVerify(user: response),
    );
  }

  Future<void> continueWithGoogle({String? role}) async {
    state = const AuthenticationState.loading();
    final response = await _dataSource.continueWithGoogle(role: role);
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.authenticatedNotVerify(user: response),
    );
  }

  Future<void> signOut() async {
    state = const AuthenticationState.loading();
    final response = await _dataSource.userSignOut();
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.unauthenticated(message: response),
    );
  }
}

class SimpleAuthNotifier extends StateNotifier {
  SimpleAuthNotifier(this._dataSource) : super(null);

  final AuthDataSource _dataSource;

  void getCurrentUser() {
    final response = _dataSource.getCurrentUser();
    state = response;
  }
}

class passVisibility extends StateNotifier<bool> {
  passVisibility() : super(false);
  void visibility() => state = !state;
}

final passProvider = StateNotifierProvider<passVisibility, bool>((ref) {
  return passVisibility();
});

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthenticationState>(
  (ref) => AuthNotifier(ref.read(authDataSourceProvider)),
);

final simpleAuthNotifierProvider =
    StateNotifierProvider<SimpleAuthNotifier, dynamic>(
  (ref) => SimpleAuthNotifier(ref.read(authDataSourceProvider)),
);
