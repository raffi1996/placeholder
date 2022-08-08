import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eds_task/databases/hive/hive.dart';
import 'package:eds_task/http/repositories/posts_repository.dart';
import 'package:mobx/mobx.dart';
import '../../models/comment_model/comment_model.dart';

part 'comment_state.g.dart';

// ignore: library_private_types_in_public_api
class CommentState = _CommentState with _$CommentState;

abstract class _CommentState with Store {
  @observable
  ObservableList<CommentModel> comments =
      ObservableList<CommentModel>.of([]).asObservable();

  @action
  Future<void> getComments(int postId) async {
    final commentsInDb = HiveDB.getComments(postId: postId);
    try {
      if (commentsInDb.isEmpty) {
        final fetchedComments =
            await PostsRepository.getComments(postId: postId).asObservable();
        comments.addAll(fetchedComments.reversed);
        HiveDB.putComments(fetchedComments);
      } else {
        comments.addAll(commentsInDb.reversed);
      }
    } on DioError catch (error) {
      log(error.toString());
    }
  }

  @action
  Future<void> postComment({
    required int postId,
    required String email,
    required String name,
    required String body,
  }) async {
    try {
      final postedComment = await PostsRepository.addComment(
        postId: postId,
        name: name,
        email: email,
        comment: body,
      );
      comments.insert(0, postedComment);
      HiveDB.putComment(postedComment);
    } on DioError catch (error) {
      log(error.toString());
    }
  }
}
