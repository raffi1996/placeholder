import 'package:mobx/mobx.dart';

part 'current_post_state.g.dart';

// ignore: library_private_types_in_public_api
class CurrentPostState = _CurrentPostState with _$CurrentPostState;

abstract class _CurrentPostState with Store {
  @observable
  bool clicked = false;
}
