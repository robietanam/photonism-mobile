import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/users.dart';
import '../../state/auth/auth_state.dart';
import '../../state/user/user_state.dart';
import '../data_source/user_data_source.dart';

class UserDataNotifier extends StateNotifier<UserState> {
  // dataSource di assign nilainya ke initial , sepertinya
  UserDataNotifier(this._dataSource) : super(const UserState.initial());

  final UserDataSource _dataSource;

  Future<void> editProfile({
    required String id,
    required User user,
    required String email,
    required String username,
    required String namaLengkap,
    String? profileImage,
  }) async {
    state = const UserState.loading();
    final response = await _dataSource.editProfile(
        id: id,
        user: user,
        email: email,
        username: username,
        namaLengkap: namaLengkap,
        profileImage: profileImage);
    state =
        response.fold((error) => UserState.failed(message: error), (response) {
      return UserState.success(user: response);
    });
  }

  // Future<void> getProfile({
  //   required String id,
  //   required User user,

  // }) async {
  //   state = const UserState.loading();
  //   final response = await _dataSource.getProfile(
  //       id: id,
  //       user: user,);
  //   state =
  //       response.fold((error) => UserState.failed(message: error), (response) {
  //     return UserState.success(user: response);
  //   });
  // }
}

final userDataNotifierProvider =
    StateNotifierProvider<UserDataNotifier, UserState>(
  (ref) => UserDataNotifier(ref.read(userDataSourceProvider)),
);
