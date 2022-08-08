import 'package:flutter/material.dart';

import 'app_colors.dart';

final base = ThemeData.light();

final lightTheme = base.copyWith(
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: base.appBarTheme.copyWith(
    iconTheme: base.iconTheme.copyWith(
      color: AppColors.charcoal,
    ),
    backgroundColor: AppColors.white,
    titleTextStyle: const TextStyle(
      color: AppColors.charcoal,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  ),
);
