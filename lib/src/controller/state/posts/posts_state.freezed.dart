// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'PostState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'PostState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PostState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_UnFetchedCopyWith<$Res> {
  factory _$$_UnFetchedCopyWith(
          _$_UnFetched value, $Res Function(_$_UnFetched) then) =
      __$$_UnFetchedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_UnFetchedCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_UnFetched>
    implements _$$_UnFetchedCopyWith<$Res> {
  __$$_UnFetchedCopyWithImpl(
      _$_UnFetched _value, $Res Function(_$_UnFetched) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_UnFetched(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UnFetched implements _UnFetched {
  const _$_UnFetched({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'PostState.unfetched(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnFetched &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnFetchedCopyWith<_$_UnFetched> get copyWith =>
      __$$_UnFetchedCopyWithImpl<_$_UnFetched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) {
    return unfetched(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) {
    return unfetched?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) {
    if (unfetched != null) {
      return unfetched(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) {
    return unfetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) {
    return unfetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (unfetched != null) {
      return unfetched(this);
    }
    return orElse();
  }
}

abstract class _UnFetched implements PostState {
  const factory _UnFetched({final String? message}) = _$_UnFetched;

  String? get message;
  @JsonKey(ignore: true)
  _$$_UnFetchedCopyWith<_$_UnFetched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchedCopyWith<$Res> {
  factory _$$_FetchedCopyWith(
          _$_Fetched value, $Res Function(_$_Fetched) then) =
      __$$_FetchedCopyWithImpl<$Res>;
  @useResult
  $Res call({Post post});
}

/// @nodoc
class __$$_FetchedCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_Fetched>
    implements _$$_FetchedCopyWith<$Res> {
  __$$_FetchedCopyWithImpl(_$_Fetched _value, $Res Function(_$_Fetched) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_$_Fetched(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc

class _$_Fetched implements _Fetched {
  const _$_Fetched({required this.post});

  @override
  final Post post;

  @override
  String toString() {
    return 'PostState.fetched(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetched &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchedCopyWith<_$_Fetched> get copyWith =>
      __$$_FetchedCopyWithImpl<_$_Fetched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) {
    return fetched(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) {
    return fetched?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class _Fetched implements PostState {
  const factory _Fetched({required final Post post}) = _$_Fetched;

  Post get post;
  @JsonKey(ignore: true)
  _$$_FetchedCopyWith<_$_Fetched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchedArrayCopyWith<$Res> {
  factory _$$_FetchedArrayCopyWith(
          _$_FetchedArray value, $Res Function(_$_FetchedArray) then) =
      __$$_FetchedArrayCopyWithImpl<$Res>;
  @useResult
  $Res call({Posts posts});
}

/// @nodoc
class __$$_FetchedArrayCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_FetchedArray>
    implements _$$_FetchedArrayCopyWith<$Res> {
  __$$_FetchedArrayCopyWithImpl(
      _$_FetchedArray _value, $Res Function(_$_FetchedArray) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_$_FetchedArray(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as Posts,
    ));
  }
}

/// @nodoc

class _$_FetchedArray implements _FetchedArray {
  const _$_FetchedArray({required this.posts});

  @override
  final Posts posts;

  @override
  String toString() {
    return 'PostState.fetchedArray(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchedArray &&
            (identical(other.posts, posts) || other.posts == posts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, posts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchedArrayCopyWith<_$_FetchedArray> get copyWith =>
      __$$_FetchedArrayCopyWithImpl<_$_FetchedArray>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) {
    return fetchedArray(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) {
    return fetchedArray?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) {
    if (fetchedArray != null) {
      return fetchedArray(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) {
    return fetchedArray(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) {
    return fetchedArray?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (fetchedArray != null) {
      return fetchedArray(this);
    }
    return orElse();
  }
}

abstract class _FetchedArray implements PostState {
  const factory _FetchedArray({required final Posts posts}) = _$_FetchedArray;

  Posts get posts;
  @JsonKey(ignore: true)
  _$$_FetchedArrayCopyWith<_$_FetchedArray> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchedArrayDoneCopyWith<$Res> {
  factory _$$_FetchedArrayDoneCopyWith(
          _$_FetchedArrayDone value, $Res Function(_$_FetchedArrayDone) then) =
      __$$_FetchedArrayDoneCopyWithImpl<$Res>;
  @useResult
  $Res call({String? done});
}

/// @nodoc
class __$$_FetchedArrayDoneCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_FetchedArrayDone>
    implements _$$_FetchedArrayDoneCopyWith<$Res> {
  __$$_FetchedArrayDoneCopyWithImpl(
      _$_FetchedArrayDone _value, $Res Function(_$_FetchedArrayDone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? done = freezed,
  }) {
    return _then(_$_FetchedArrayDone(
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FetchedArrayDone implements _FetchedArrayDone {
  const _$_FetchedArrayDone({this.done});

  @override
  final String? done;

  @override
  String toString() {
    return 'PostState.fetchedArrayDone(done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchedArrayDone &&
            (identical(other.done, done) || other.done == done));
  }

  @override
  int get hashCode => Object.hash(runtimeType, done);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchedArrayDoneCopyWith<_$_FetchedArrayDone> get copyWith =>
      __$$_FetchedArrayDoneCopyWithImpl<_$_FetchedArrayDone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) {
    return fetchedArrayDone(done);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) {
    return fetchedArrayDone?.call(done);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) {
    if (fetchedArrayDone != null) {
      return fetchedArrayDone(done);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) {
    return fetchedArrayDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) {
    return fetchedArrayDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (fetchedArrayDone != null) {
      return fetchedArrayDone(this);
    }
    return orElse();
  }
}

abstract class _FetchedArrayDone implements PostState {
  const factory _FetchedArrayDone({final String? done}) = _$_FetchedArrayDone;

  String? get done;
  @JsonKey(ignore: true)
  _$$_FetchedArrayDoneCopyWith<_$_FetchedArrayDone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Success(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'PostState.success(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PostState {
  const factory _Success({final String? message}) = _$_Success;

  String? get message;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessBuatCopyWith<$Res> {
  factory _$$_SuccessBuatCopyWith(
          _$_SuccessBuat value, $Res Function(_$_SuccessBuat) then) =
      __$$_SuccessBuatCopyWithImpl<$Res>;
  @useResult
  $Res call({Post post});
}

/// @nodoc
class __$$_SuccessBuatCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_SuccessBuat>
    implements _$$_SuccessBuatCopyWith<$Res> {
  __$$_SuccessBuatCopyWithImpl(
      _$_SuccessBuat _value, $Res Function(_$_SuccessBuat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_$_SuccessBuat(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc

class _$_SuccessBuat implements _SuccessBuat {
  const _$_SuccessBuat({required this.post});

  @override
  final Post post;

  @override
  String toString() {
    return 'PostState.successBuat(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessBuat &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessBuatCopyWith<_$_SuccessBuat> get copyWith =>
      __$$_SuccessBuatCopyWithImpl<_$_SuccessBuat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) {
    return successBuat(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) {
    return successBuat?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) {
    if (successBuat != null) {
      return successBuat(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) {
    return successBuat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) {
    return successBuat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successBuat != null) {
      return successBuat(this);
    }
    return orElse();
  }
}

abstract class _SuccessBuat implements PostState {
  const factory _SuccessBuat({required final Post post}) = _$_SuccessBuat;

  Post get post;
  @JsonKey(ignore: true)
  _$$_SuccessBuatCopyWith<_$_SuccessBuat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailedCopyWith<$Res> {
  factory _$$_FailedCopyWith(_$_Failed value, $Res Function(_$_Failed) then) =
      __$$_FailedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_FailedCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_Failed>
    implements _$$_FailedCopyWith<$Res> {
  __$$_FailedCopyWithImpl(_$_Failed _value, $Res Function(_$_Failed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Failed(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Failed implements _Failed {
  const _$_Failed({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'PostState.failed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      __$$_FailedCopyWithImpl<_$_Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) unfetched,
    required TResult Function(Post post) fetched,
    required TResult Function(Posts posts) fetchedArray,
    required TResult Function(String? done) fetchedArrayDone,
    required TResult Function(String? message) success,
    required TResult Function(Post post) successBuat,
    required TResult Function(String? message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? unfetched,
    TResult? Function(Post post)? fetched,
    TResult? Function(Posts posts)? fetchedArray,
    TResult? Function(String? done)? fetchedArrayDone,
    TResult? Function(String? message)? success,
    TResult? Function(Post post)? successBuat,
    TResult? Function(String? message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? unfetched,
    TResult Function(Post post)? fetched,
    TResult Function(Posts posts)? fetchedArray,
    TResult Function(String? done)? fetchedArrayDone,
    TResult Function(String? message)? success,
    TResult Function(Post post)? successBuat,
    TResult Function(String? message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnFetched value) unfetched,
    required TResult Function(_Fetched value) fetched,
    required TResult Function(_FetchedArray value) fetchedArray,
    required TResult Function(_FetchedArrayDone value) fetchedArrayDone,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessBuat value) successBuat,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnFetched value)? unfetched,
    TResult? Function(_Fetched value)? fetched,
    TResult? Function(_FetchedArray value)? fetchedArray,
    TResult? Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessBuat value)? successBuat,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UnFetched value)? unfetched,
    TResult Function(_Fetched value)? fetched,
    TResult Function(_FetchedArray value)? fetchedArray,
    TResult Function(_FetchedArrayDone value)? fetchedArrayDone,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessBuat value)? successBuat,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements PostState {
  const factory _Failed({final String? message}) = _$_Failed;

  String? get message;
  @JsonKey(ignore: true)
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      throw _privateConstructorUsedError;
}
