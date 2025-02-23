import 'package:fluent_ui/fluent_ui.dart';
import 'package:masela/app.dart';
import 'core/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseHelper = DatabaseHelper.instance;
  await databaseHelper.database;
  runApp(const MaselaApp());
}
