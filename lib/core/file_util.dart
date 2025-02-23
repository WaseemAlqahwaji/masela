import 'dart:io';

class FileUtil {
  static Future<String> saveImage({required File image}) async {
    final String userPath = Platform.environment['USERPROFILE']!;
    final dbPath = '$userPath\\appData\\local\\masela\\photos';
    String p = '$dbPath\\${DateTime.now().microsecondsSinceEpoch}.png';
    File file = File(p);
    await file.create(recursive: true);
    await file.writeAsBytes(image.readAsBytesSync());
    return p;
  }

  static Future<void> delete({required String path}) async {
    await File(path).delete();
  }
}
