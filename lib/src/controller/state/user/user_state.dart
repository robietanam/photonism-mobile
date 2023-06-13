import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/users.dart';

part "user_state.freezed.dart";

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;

  const factory UserState.loading() = _Loading;

  const factory UserState.success({required User user}) = _Success;

  const factory UserState.failed({String? message}) = _Failed;
}
