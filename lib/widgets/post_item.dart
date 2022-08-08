import 'package:flutter/material.dart';

import '../constants/ui_text.dart';
import '../models/post_model/post_model.dart';
import '../themes/app_colors.dart';
import '../extensions/context_extension.dart';

class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 200,
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 10,
              color: AppColors.charcoal.withOpacity(.5),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              UiText.title,
              style: context.theme.headline6.copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              post.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.theme.headline6.copyWith(
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              post.body,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: context.theme.headline6.copyWith(
                fontSize: 12,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
