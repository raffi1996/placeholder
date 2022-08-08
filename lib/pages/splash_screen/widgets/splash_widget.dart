import 'package:flutter/material.dart';

import '../../../constants/ui_text.dart';
import '../../../themes/app_colors.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              UiText.splashTitle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColors.charcoal,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 30,
              ),
              child: const Text(
                UiText.splashSubtitle,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.charcoal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
