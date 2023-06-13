import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/users.dart';

part "auth_state.freezed.dart";

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;

  const factory AuthenticationState.loading() = _Loading;

  const factory AuthenticationState.unauthenticated({String? message}) =
      _UnAuthentication;

  const factory AuthenticationState.authenticated({required User user}) =
      _Authenticated;

  const factory AuthenticationState.success({String? message}) = _Success;

  const factory AuthenticationState.failed({String? message}) = _Failed;
}
