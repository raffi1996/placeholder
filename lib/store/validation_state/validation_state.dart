import 'package:mobx/mobx.dart';
import '../../constants/regexp.dart';
import '../../constants/ui_text.dart';

part 'validation_state.g.dart';

// ignore: library_private_types_in_public_api
class ValidationState = _ValidationState with _$ValidationState;

abstract class _ValidationState with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String name = '';

  @observable
  String body = '';

  @observable
  String email = '';

  List<ReactionDisposer>? _disposers;

  void setupValidations() {
    if (_disposers != null) {
      return;
    }
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => name, validateName),
      reaction((_) => body, validateBody),
    ];
  }

  void dispose() {
    if (_disposers == null) {
      return;
    }
    for (final d in _disposers!) {
      d();
    }
  }

  @action
  void validateEmail(_) {
    error.email = email.trim().isEmpty
        ? UiText.emailRequired
        : !email.contains(RegExp(emailRegExp))
            ? UiText.emailError
            : null;
  }

  @action
  void validateBody(_) {
    error.body = body.trim().isEmpty ? UiText.bodyError : null;
  }

  @action
  void validateName(_) {
    error.name = name.trim().isEmpty ? UiText.nameError : null;
  }

  void validateAll() {
    validateEmail(email);
    validateBody(body);
    validateName(name);
  }
}

// ignore: library_private_types_in_public_api
class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? body;

  @computed
  bool get hasErrors => email != null || name != null || body != null;
}
