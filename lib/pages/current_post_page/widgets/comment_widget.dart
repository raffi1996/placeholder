import 'package:eds_task/constants/ui_text.dart';
import 'package:eds_task/models/comment_model/comment_model.dart';
import 'package:flutter/material.dart';
import '../../../extensions/context_extension.dart';
import '../../../themes/app_colors.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel comment;

  const CommentWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: MediaQuery.of(context).size.width * .8,
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
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UiText.name,
              style: context.theme.headline6,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              comment.name,
              style: context.theme.headline6.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              UiText.comment,
              style: context.theme.headline6,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              comment.body,
              style: context.theme.bodyText2,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              UiText.email,
              style: context.theme.headline6,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(comment.email),
          ],
        ),
      ),
    );
  }
}
