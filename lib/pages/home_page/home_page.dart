import 'package:flutter/material.dart';

import '../../constants/route_names.dart';
import '../../constants/ui_text.dart';
import '../../models/user_model/user_model.dart';
import '../../providers/get_it.dart';
import '../../store/user_state/user_state.dart';
import '../../widgets/user_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userState = locator<UserState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          UiText.splashTitle,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: userState.users.length,
        itemBuilder: (_, index) {
          return UserWidget(
              user: userState.users[index],
              onTap: () {
                onTap(
                  context,
                  userState.users[index],
                );
              });
        },
      ),
    );
  }

  void onTap(BuildContext context, UserModel user) {
    Navigator.pushNamed(
      context,
      RouteNames.userPage,
      arguments: user,
    );
  }
}
