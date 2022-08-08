import 'package:eds_task/mixins/after_layout_mixin.dart';
import 'package:eds_task/store/comment_state/comment_state.dart';
import 'package:eds_task/store/current_post_state/current_post_state.dart';
import 'package:eds_task/store/loading_state/loading_state.dart';
import 'package:eds_task/store/validation_state/validation_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/ui_text.dart';
import '../../models/post_model/post_model.dart';
import '../../extensions/context_extension.dart';
import '../../themes/app_colors.dart';
import 'widgets/comment_widget.dart';
import 'widgets/form_widget.dart';

class CurrentPostPage extends StatefulWidget {
  final PostModel post;

  const CurrentPostPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<CurrentPostPage> createState() => _CurrentPostPageState();
}

class _CurrentPostPageState extends State<CurrentPostPage>
    with AfterLayoutMixin {
  final CommentState _commentState = CommentState();
  final CurrentPostState _currentPostState = CurrentPostState();
  final LoadingState _loadingState = LoadingState();
  final ValidationState _validationState = ValidationState();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _validationState.setupValidations();
    _loadingState.startLoading();
  }

  @override
  void dispose() {
    _bodyController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _validationState.dispose();
    super.dispose();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    await _commentState.getComments(widget.post.id);
    _loadingState.stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          UiText.post,
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 100,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      UiText.title,
                      style: context.theme.headline6,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.post.title,
                      style: context.theme.headline6.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      widget.post.body,
                      style: context.theme.headline6.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Observer(
                      builder: (_) => _loadingState.loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  UiText.comments,
                                  style: context.theme.headline6,
                                ),
                                const SizedBox(height: 12),
                                Observer(
                                  builder: (_) => SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .45,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      clipBehavior: Clip.none,
                                      dragStartBehavior: DragStartBehavior.down,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: _commentState.comments.length,
                                      itemBuilder: (_, index) {
                                        return CommentWidget(
                                          comment:
                                              _commentState.comments[index],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                AppColors.charcoal,
                              ),
                            ),
                            onPressed: () {
                              _currentPostState.clicked =
                                  !_currentPostState.clicked;
                            },
                            child: Observer(
                              builder: (_) => Text(
                                _currentPostState.clicked
                                    ? UiText.cancel
                                    : UiText.addComment,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Observer(
                      builder: (_) => _currentPostState.clicked
                          ? FormWidgetState(
                              onChangeEmail: (value) {
                                _validationState.email = value;
                                _validationState.error.email = null;
                              },
                              onChangeBody: (value) {
                                _validationState.body = value;
                                _validationState.error.body = null;
                              },
                              onChangeName: (value) {
                                _validationState.name = value;
                                _validationState.error.name = null;
                              },
                              bodyController: _bodyController,
                              emailController: _emailController,
                              nameController: _nameController,
                              emailError: _validationState.error.email != null
                                  ? _validationState.error.email!
                                  : null,
                              bodyError: _validationState.error.body != null
                                  ? _validationState.error.body!
                                  : null,
                              nameError: _validationState.error.name != null
                                  ? _validationState.error.name!
                                  : null,
                              onAddComment: onAddComment,
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddComment() async {
    _validationState.validateAll();
    if (_validationState.error.hasErrors) {
      return;
    }
    await _commentState.postComment(
      postId: widget.post.id,
      email: _emailController.text,
      name: _nameController.text,
      body: _bodyController.text,
    );
    _emailController.clear();
    _nameController.clear();
    _bodyController.clear();
    _currentPostState.clicked = !_currentPostState.clicked;
  }
}
