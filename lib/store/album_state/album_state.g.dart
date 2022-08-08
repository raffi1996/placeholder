// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlbumState on _AlbumState, Store {
  late final _$albumsAtom = Atom(name: '_AlbumState.albums', context: context);

  @override
  List<AlbumModel> get albums {
    _$albumsAtom.reportRead();
    return super.albums;
  }

  @override
  set albums(List<AlbumModel> value) {
    _$albumsAtom.reportWrite(value, super.albums, () {
      super.albums = value;
    });
  }

  late final _$getAllAlbumsAsyncAction =
      AsyncAction('_AlbumState.getAllAlbums', context: context);

  @override
  Future<void> getAllAlbums(int userId) {
    return _$getAllAlbumsAsyncAction.run(() => super.getAllAlbums(userId));
  }

  @override
  String toString() {
    return '''
albums: ${albums}
    ''';
  }
}
