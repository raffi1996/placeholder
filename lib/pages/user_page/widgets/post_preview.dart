import 'package:eds_task/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../constants/route_names.dart';
import '../../../constants/ui_text.dart';
import '../../../models/post_model/post_model.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/post_item.dart';

class PostPreview extends StatelessWidget {
  final List<PostModel> posts;

  const PostPreview({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              UiText.posts,
              style: context.theme.headline6,
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  AppColors.grayRegular,
                ),
              ),
              onPressed: () {
                onNavigatePostsPage(context);
              },
              child: const Text(
                UiText.viewAll,
                style: TextStyle(
                  color: AppColors.charcoal,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (_, index) {
              return PostItem(
                post: posts[index],
              );
            },
          ),
        ),
      ],
    );
  }

  void onNavigatePostsPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteNames.postsPage,
      arguments: posts,
    );
  }
}
