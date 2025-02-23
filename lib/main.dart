import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';

import 'core/database_helper.dart';
import 'core/database_init.dart';
import 'screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseHelper = DatabaseHelper.instance;
  final databaseInit = DatabaseInit(databaseHelper: databaseHelper);
  await databaseInit.initializeDatabase();
  print(Platform.environment);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: FluentThemeData(
      ),
      home: const Screen(),
    );
  }
}
