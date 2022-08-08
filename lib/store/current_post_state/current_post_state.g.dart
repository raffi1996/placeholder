// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_post_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentPostState on _CurrentPostState, Store {
  late final _$clickedAtom =
      Atom(name: '_CurrentPostState.clicked', context: context);

  @override
  bool get clicked {
    _$clickedAtom.reportRead();
    return super.clicked;
  }

  @override
  set clicked(bool value) {
    _$clickedAtom.reportWrite(value, super.clicked, () {
      super.clicked = value;
    });
  }

  @override
  String toString() {
    return '''
clicked: ${clicked}
    ''';
  }
}
