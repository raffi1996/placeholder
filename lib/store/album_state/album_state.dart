import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eds_task/databases/hive/hive.dart';
import 'package:eds_task/http/repositories/album_repository.dart';
import 'package:mobx/mobx.dart';
import '../../models/album_model/album_model.dart';

part 'album_state.g.dart';

// ignore: library_private_types_in_public_api
class AlbumState = _AlbumState with _$AlbumState;

abstract class _AlbumState with Store {
  @observable
  List<AlbumModel> albums = [];

  @action
  Future<void> getAllAlbums(int userId) async {
    final albumsInDb = HiveDB.getAlbums(userId: userId);
    try {
      if (albumsInDb.isEmpty) {
        albums = await AlbumRepository.getAlbums(userId: userId);
        HiveDB.putAlbums(albums);
      } else {
        albums = albumsInDb;
      }
    } on DioError catch (error) {
      log(error.toString());
    }
  }
}
