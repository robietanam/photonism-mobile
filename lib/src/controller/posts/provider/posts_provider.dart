import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/posts.dart';
import '../../../models/users.dart';
import '../../state/posts/posts_state.dart';
import '../data_source/posts_data_source.dart';

class PostsNotifier extends StateNotifier<PostState> {
  // dataSource di assign nilainya ke initial , sepertinya
  PostsNotifier(this._dataSource) : super(const PostState.initial());

  final PostsDataSource _dataSource;

  Future<void> createPost({
    required User user,
    required List<String> photo,
    required String desc,
    required List<double> location,
  }) async {
    state = const PostState.loading();
    final response = await _dataSource.createPost(
        user: user, photo: photo, desc: desc, location: location);
    state =
        response.fold((error) => PostState.failed(message: error), (response) {
      return PostState.successBuat(post: response);
    });
  }

  Future<void> editPost({
    required User user,
    required Post post,
    required Map<String?, ImageProvider<Object>?> photo,
    required String desc,
    required List<double> location,
  }) async {
    state = const PostState.loading();
    final response = await _dataSource.editPost(
        post: post, user: user, photo: photo, desc: desc, location: location);
    state =
        response.fold((error) => PostState.failed(message: error), (response) {
      return PostState.successBuat(post: response);
    });
  }

  Future<void> getPosts({
    required User user,
    required int start,
    required int banyak,
  }) async {
    state = const PostState.loading();
    final response = await _dataSource.getFeedPosts(
        user: user, start: start, banyak: banyak);
    state = response.fold(
        (error) => PostState.unfetched(message: error),
        (response) => response.fold(
            (noPost) => PostState.fetchedArrayDone(done: noPost),
            (response) => PostState.fetchedArray(posts: response)));
  }

  Future<void> getPostsPopuler({
    required User user,
  }) async {
    state = const PostState.loading();
    final response = await _dataSource.getFeedPostsPopuler(user: user);
    state = response.fold((error) => PostState.unfetched(message: error),
        (response) => PostState.fetchedArray(posts: response));
  }
}

final postsNotifierProvider = StateNotifierProvider<PostsNotifier, PostState>(
  (ref) => PostsNotifier(ref.read(postsDataSourceProvider)),
);

final postsPopulerNotifierProvider =
    StateNotifierProvider<PostsNotifier, PostState>(
  (ref) => PostsNotifier(ref.read(postsDataSourceProvider)),
);
