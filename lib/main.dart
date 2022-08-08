import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'databases/hive/hive.dart';
import 'providers/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerGetIt();
  await Hive.initFlutter();
  await HiveDB.getInstance();
  runApp(const MyApp());
}
