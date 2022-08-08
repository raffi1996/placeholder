import 'package:flutter/material.dart';

import '../models/user_model/user_model.dart';

class UserWidget extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserWidget({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(user.username),
      subtitle: Text(user.name),
    );
  }
}
