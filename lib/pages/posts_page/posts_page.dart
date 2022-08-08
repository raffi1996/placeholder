import 'package:eds_task/widgets/post_item.dart';
import 'package:flutter/material.dart';

import '../../constants/route_names.dart';
import '../../constants/ui_text.dart';
import '../../models/post_model/post_model.dart';

class PostsPage extends StatelessWidget {
  final List<PostModel> posts;

  const PostsPage({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          UiText.posts,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: posts.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
              onTap: () {
                onNavigateCurrentPost(
                  context,
                  posts[index],
                );
              },
              child: PostItem(
                post: posts[index],
              ),
            ),
          );
        },
      ),
    );
  }

  void onNavigateCurrentPost(BuildContext context, PostModel post) {
    Navigator.pushNamed(
      context,
      RouteNames.currentPost,
      arguments: post,
    );
  }
}
