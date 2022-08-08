import 'package:eds_task/models/album_model/album_model.dart';
import 'package:eds_task/widgets/album_item.dart';
import 'package:flutter/material.dart';
import '../../constants/ui_text.dart';

class AlbumPage extends StatelessWidget {
  final List<AlbumModel> albums;

  const AlbumPage({
    Key? key,
    required this.albums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          UiText.albums,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: albums.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AlbumItem(
              album: albums[index],
            ),
          );
        },
      ),
    );
  }
}
