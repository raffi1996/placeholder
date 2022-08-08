// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) {
  return _AlbumModel.fromJson(json);
}

/// @nodoc
mixin _$AlbumModel {
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumModelCopyWith<AlbumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumModelCopyWith<$Res> {
  factory $AlbumModelCopyWith(
          AlbumModel value, $Res Function(AlbumModel) then) =
      _$AlbumModelCopyWithImpl<$Res>;
  $Res call({int userId, int id, String title});
}

/// @nodoc
class _$AlbumModelCopyWithImpl<$Res> implements $AlbumModelCopyWith<$Res> {
  _$AlbumModelCopyWithImpl(this._value, this._then);

  final AlbumModel _value;
  // ignore: unused_field
  final $Res Function(AlbumModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AlbumModelCopyWith<$Res>
    implements $AlbumModelCopyWith<$Res> {
  factory _$$_AlbumModelCopyWith(
          _$_AlbumModel value, $Res Function(_$_AlbumModel) then) =
      __$$_AlbumModelCopyWithImpl<$Res>;
  @override
  $Res call({int userId, int id, String title});
}

/// @nodoc
class __$$_AlbumModelCopyWithImpl<$Res> extends _$AlbumModelCopyWithImpl<$Res>
    implements _$$_AlbumModelCopyWith<$Res> {
  __$$_AlbumModelCopyWithImpl(
      _$_AlbumModel _value, $Res Function(_$_AlbumModel) _then)
      : super(_value, (v) => _then(v as _$_AlbumModel));

  @override
  _$_AlbumModel get _value => super._value as _$_AlbumModel;

  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_AlbumModel(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumModel implements _AlbumModel {
  _$_AlbumModel({required this.userId, required this.id, required this.title});

  factory _$_AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumModelFromJson(json);

  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'AlbumModel(userId: $userId, id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumModel &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_AlbumModelCopyWith<_$_AlbumModel> get copyWith =>
      __$$_AlbumModelCopyWithImpl<_$_AlbumModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumModelToJson(
      this,
    );
  }
}

abstract class _AlbumModel implements AlbumModel {
  factory _AlbumModel(
      {required final int userId,
      required final int id,
      required final String title}) = _$_AlbumModel;

  factory _AlbumModel.fromJson(Map<String, dynamic> json) =
      _$_AlbumModel.fromJson;

  @override
  int get userId;
  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumModelCopyWith<_$_AlbumModel> get copyWith =>
      throw _privateConstructorUsedError;
}
