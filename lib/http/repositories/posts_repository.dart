import 'package:eds_task/models/post_model/post_model.dart';

import '../../models/comment_model/comment_model.dart';
import '../dio.dart';

class PostsRepository {
  static Future<List<PostModel>> getUserPosts({
    required int userId,
  }) async {
    final response = await dio.get(
      '/posts',
      queryParameters: {
        'userId': userId,
      },
    );
    if (response.statusCode == 200) {
      List<PostModel> posts = [];
      response.data.map((json) => posts.add(PostModel.fromJson(json))).toList();
      return posts;
    } else {
      throw Exception("server problem");
    }
  }

  static Future<List<CommentModel>> getComments({required int postId}) async {
    final response = await dio.get(
      '/comments',
      queryParameters: {
        'postId': postId,
      },
    );

    if (response.statusCode == 200) {
      List<CommentModel> comments = [];
      response.data
          .map((json) => comments.add(CommentModel.fromJson(json)))
          .toList();
      return comments;
    } else {
      throw Exception("server problem");
    }
  }

  static Future<CommentModel> addComment({
    required postId,
    required String email,
    required String name,
    required String comment,
  }) async {
    final response = await dio.post('/comments', data: {
      'name': name,
      'body': comment,
      'email': email,
      'postId': postId,
    });

    return CommentModel.fromJson(response.data);
  }
}
