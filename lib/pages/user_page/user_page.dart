import 'package:eds_task/constants/ui_text.dart';
import 'package:eds_task/mixins/after_layout_mixin.dart';
import 'package:eds_task/pages/user_page/widgets/company_info.dart';
import 'package:eds_task/pages/user_page/widgets/user_info.dart';
import 'package:eds_task/store/loading_state/loading_state.dart';
import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';
import '../../models/user_model/user_model.dart';
import '../../store/album_state/album_state.dart';
import '../../store/posts_state/posts_state.dart';
import '../../themes/app_colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widgets/album_preview.dart';
import 'widgets/post_preview.dart';

class UserPage extends StatefulWidget {
  final UserModel user;

  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with AfterLayoutMixin {
  final PostsState _postsState = PostsState();
  final LoadingState _loadingState = LoadingState();
  final AlbumState _albumState = AlbumState();

  @override
  void initState() {
    super.initState();
    _loadingState.startLoading();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    await _postsState.getAllPosts(
      widget.user.id,
    );
    await _albumState.getAllAlbums(
      widget.user.id,
    );
    _loadingState.stopLoading();
  }

  String get name => '${UiText.name}: ${widget.user.name}';

  String get email => '${UiText.email}: ${widget.user.email}';

  String get phone => '${UiText.phone}: ${widget.user.phone}';

  String get website => '${UiText.website}: ${widget.user.website}';

  String get companyName =>
      '${UiText.companyName}: ${widget.user.company.name}';

  String get catchPhrase =>
      '${UiText.catchPhrase}: ${widget.user.company.catchPhrase}';

  String get bs => '${UiText.bs}: ${widget.user.company.bs}';

  String get address =>
      '${UiText.address}: ${widget.user.address.city}, ${widget.user.address.street}, ${widget.user.address.suite}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.user.username,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            UserInfo(
              name: name,
              email: email,
              phone: phone,
              website: website,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              address,
              style: context.theme.headline6.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 40,
            ),
            CompanyInfo(
              companyName: companyName,
              catchPhrase: catchPhrase,
              bs: bs,
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_) => _loadingState.loading
                  ? const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.charcoal,
                        ),
                      ),
                    )
                  : PostPreview(
                      posts: _postsState.posts,
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_) => _loadingState.loading
                  ? const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.charcoal,
                        ),
                      ),
                    )
                  : AlbumPreview(
                      albums: _albumState.albums,
                    ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 24,
            ),
          ],
        ),
      ),
    );
  }
}
