import 'package:eds_task/models/album_model/album_model.dart';
import 'package:flutter/material.dart';

import '../constants/ui_text.dart';
import '../themes/app_colors.dart';
import '../extensions/context_extension.dart';

class AlbumItem extends StatelessWidget {
  final AlbumModel album;

  const AlbumItem({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 200,
      height: 60,
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
              album.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.theme.headline6.copyWith(
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
