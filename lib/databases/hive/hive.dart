import 'dart:convert';
import 'package:eds_task/models/album_model/album_model.dart';
import 'package:eds_task/models/comment_model/comment_model.dart';
import 'package:eds_task/models/post_model/post_model.dart';
import 'package:hive/hive.dart';

import '../../models/user_model/user_model.dart';

class Keys {
  static const users = 'users';
  static const posts = 'posts';
  static const albums = 'albums';
  static const comments = 'comments';
}

class HiveDB {
  static final _userBox = Hive.box(Keys.users);
  static final _postsBox = Hive.box(Keys.posts);
  static final _albumsBox = Hive.box(Keys.albums);
  static final _commentsBox = Hive.box(Keys.comments);

  static Future<HiveDB> getInstance() async {
    await Hive.openBox(Keys.users);
    await Hive.openBox(Keys.posts);
    await Hive.openBox(Keys.albums);
    await Hive.openBox(Keys.comments);
    return HiveDB();
  }

  static void putUser(List<UserModel> value) {
    for (int i = 0; i < value.length; ++i) {
      final json = jsonEncode(value[i]);
      _userBox.add(json);
    }
  }

  static void putPosts(List<PostModel> value) {
    for (int i = 0; i < value.length; ++i) {
      final json = jsonEncode(value[i]);
      _postsBox.add(json);
    }
  }

  static void putAlbums(List<AlbumModel> value) {
    for (int i = 0; i < value.length; ++i) {
      final json = jsonEncode(value[i]);
      _albumsBox.add(json);
    }
  }

  static void putComments(List<CommentModel> value) {
    for (int i = 0; i < value.length; ++i) {
      final json = jsonEncode(value[i]);
      _commentsBox.add(json);
    }
  }

  static void putComment(CommentModel value) {
    final json = jsonEncode(value);
    _commentsBox.add(json);
  }

  static List<UserModel> getUsers() {
    final values = _userBox.values;
    return values
        .map((e) => UserModel.fromJson(json.decode(e.toString())))
        .toList();
  }

  static List<PostModel> getPosts({required int userId}) {
    final values = _postsBox.values;
    final filteredPosts =
        values.where((item) => item.contains('"userId":$userId')).toList();
    return filteredPosts
        .map((e) => PostModel.fromJson(json.decode(e.toString())))
        .toList();
  }

  static List<AlbumModel> getAlbums({required int userId}) {
    final values = _albumsBox.values;
    final filteredAlbums =
        values.where((item) => item.contains('"userId":$userId')).toList();
    return filteredAlbums
        .map((e) => AlbumModel.fromJson(json.decode(e.toString())))
        .toList();
  }

  static List<CommentModel> getComments({required int postId}) {
    final values = _commentsBox.values;
    final filteredComments =
        values.where((item) => item.contains('"postId":$postId')).toList();
    return filteredComments
        .map((e) => CommentModel.fromJson(json.decode(e.toString())))
        .toList();
  }
}
