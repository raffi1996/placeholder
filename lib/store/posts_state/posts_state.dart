import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eds_task/databases/hive/hive.dart';
import 'package:eds_task/http/repositories/posts_repository.dart';
import 'package:mobx/mobx.dart';
import '../../models/post_model/post_model.dart';

part 'posts_state.g.dart';

// ignore: library_private_types_in_public_api
class PostsState = _PostsState with _$PostsState;

abstract class _PostsState with Store {
  @observable
  List<PostModel> posts = [];

  @action
  Future<void> getAllPosts(int userId) async {
    final postsInDb = HiveDB.getPosts(userId: userId);
    try {
      if (postsInDb.isEmpty) {
        posts = await PostsRepository.getUserPosts(userId: userId);
        HiveDB.putPosts(posts);
      } else {
        posts = postsInDb;
      }
    } on DioError catch (error) {
      log(error.toString());
    }
  }
}
