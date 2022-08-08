import 'package:flutter/material.dart';
import '../../constants/route_names.dart';
import '../../mixins/after_layout_mixin.dart';
import '../../providers/get_it.dart';
import '../../store/user_state/user_state.dart';
import 'widgets/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Future afterFirstLayout(BuildContext context) async {
    await checkSession(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SplashWidget(),
      ),
    );
  }

  Future<void> checkSession(BuildContext context) async {
    await locator<UserState>().getAllUsers();
    if (!mounted) return;
    Navigator.popAndPushNamed(context, RouteNames.homePage);
  }
}
