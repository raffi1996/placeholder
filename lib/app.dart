import 'package:flutter/material.dart' hide Router;

import 'constants/route_names.dart';
import 'routes.dart';
import 'themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      title: 'Flutter placeholder app',
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
