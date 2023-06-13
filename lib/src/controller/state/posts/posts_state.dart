import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/posts.dart';

part "posts_state.freezed.dart";

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = _Initial;

  const factory PostState.loading() = _Loading;

  const factory PostState.unfetched({String? message}) = _UnFetched;

  const factory PostState.fetched({required Post post}) = _Fetched;

  const factory PostState.fetchedArray({required Posts posts}) = _FetchedArray;

  const factory PostState.fetchedArrayDone({String? done}) = _FetchedArrayDone;

  const factory PostState.success({String? message}) = _Success;

  const factory PostState.successBuat({required Post post}) = _SuccessBuat;

  const factory PostState.failed({String? message}) = _Failed;
}
