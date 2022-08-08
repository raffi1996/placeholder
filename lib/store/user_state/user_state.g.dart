// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserState on _UserState, Store {
  late final _$usersAtom = Atom(name: '_UserState.users', context: context);

  @override
  List<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$getAllUsersAsyncAction =
      AsyncAction('_UserState.getAllUsers', context: context);

  @override
  Future<void> getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  @override
  String toString() {
    return '''
users: ${users}
    ''';
  }
}
