import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ThemeDataHelper on ThemeData {
  TextStyle get bodyText2 => textTheme.bodyText2!;

  TextStyle get headline6 => textTheme.headline6!;
}
