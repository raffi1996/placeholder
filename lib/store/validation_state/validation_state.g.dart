// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ValidationState on _ValidationState, Store {
  late final _$nameAtom = Atom(name: '_ValidationState.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$bodyAtom = Atom(name: '_ValidationState.body', context: context);

  @override
  String get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(String value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_ValidationState.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$_ValidationStateActionController =
      ActionController(name: '_ValidationState', context: context);

  @override
  void validateEmail(dynamic _) {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.validateEmail');
    try {
      return super.validateEmail(_);
    } finally {
      _$_ValidationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateBody(dynamic _) {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.validateBody');
    try {
      return super.validateBody(_);
    } finally {
      _$_ValidationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(dynamic _) {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.validateName');
    try {
      return super.validateName(_);
    } finally {
      _$_ValidationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
body: ${body},
email: ${email}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  late final _$nameAtom = Atom(name: '_FormErrorState.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_FormErrorState.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$bodyAtom = Atom(name: '_FormErrorState.body', context: context);

  @override
  String? get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(String? value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
body: ${body},
hasErrors: ${hasErrors}
    ''';
  }
}
