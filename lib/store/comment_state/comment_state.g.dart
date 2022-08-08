// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommentState on _CommentState, Store {
  late final _$commentsAtom =
      Atom(name: '_CommentState.comments', context: context);

  @override
  ObservableList<CommentModel> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(ObservableList<CommentModel> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$getCommentsAsyncAction =
      AsyncAction('_CommentState.getComments', context: context);

  @override
  Future<void> getComments(int postId) {
    return _$getCommentsAsyncAction.run(() => super.getComments(postId));
  }

  late final _$postCommentAsyncAction =
      AsyncAction('_CommentState.postComment', context: context);

  @override
  Future<void> postComment(
      {required int postId,
      required String email,
      required String name,
      required String body}) {
    return _$postCommentAsyncAction.run(() => super
        .postComment(postId: postId, email: email, name: name, body: body));
  }

  @override
  String toString() {
    return '''
comments: ${comments}
    ''';
  }
}
