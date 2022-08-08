import 'package:eds_task/extensions/context_extension.dart';
import 'package:eds_task/models/album_model/album_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/route_names.dart';
import '../../../constants/ui_text.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/album_item.dart';

class AlbumPreview extends StatelessWidget {
  final List<AlbumModel> albums;

  const AlbumPreview({
    Key? key,
    required this.albums,
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
              UiText.albums,
              style: context.theme.headline6,
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  AppColors.grayRegular,
                ),
              ),
              onPressed: () {
                onNavigateAlbumPage(context);
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
          height: 100,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (_, index) {
              return AlbumItem(
                album: albums[index],
              );
            },
          ),
        ),
      ],
    );
  }

  void onNavigateAlbumPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteNames.albumPage,
      arguments: albums,
    );
  }
}
