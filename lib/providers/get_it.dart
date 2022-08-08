import 'package:get_it/get_it.dart';

import '../store/user_state/user_state.dart';

final locator = GetIt.instance;

void registerGetIt() {
  registerSingleTone();
}

void registerSingleTone() {
  locator.registerSingleton(UserState());
}

///this for log out
void reRegisterStoreGetIt() {
  final userState = locator<UserState>();

  locator.unregister(instance: userState);

  registerSingleTone();
}
