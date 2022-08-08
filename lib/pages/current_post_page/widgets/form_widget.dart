import 'package:flutter/material.dart';

import '../../../constants/ui_text.dart';

class FormWidgetState extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController bodyController;
  final VoidCallback onAddComment;
  final String? nameError;
  final String? emailError;
  final String? bodyError;
  final Function(String) onChangeEmail;
  final Function(String) onChangeName;
  final Function(String) onChangeBody;

  const FormWidgetState({
    Key? key,
    required this.emailController,
    required this.bodyController,
    required this.nameController,
    required this.onAddComment,
    required this.onChangeEmail,
    required this.onChangeBody,
    required this.onChangeName,
    this.nameError,
    this.emailError,
    this.bodyError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            errorText: emailError,
            hintText: UiText.email,
          ),
          onChanged: onChangeEmail,
          controller: emailController,
        ),
        TextField(
          decoration: InputDecoration(
            errorText: nameError,
            hintText: UiText.name,
          ),
          controller: nameController,
          onChanged: onChangeName,
        ),
        TextField(
          decoration: InputDecoration(
            errorText: bodyError,
            hintText: UiText.comment,
          ),
          controller: bodyController,
          onChanged: onChangeBody,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onAddComment,
                child: const Text(UiText.send),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom + 24,
        ),
      ],
    );
  }
}
