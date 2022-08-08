import '../../../extensions/context_extension.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String website;

  const UserInfo({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: context.theme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          email,
          style: context.theme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          phone,
          style: context.theme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          website,
          style: context.theme.headline6,
        ),
      ],
    );
  }
}
