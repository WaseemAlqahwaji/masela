import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FilePickUtil {
  // static Future<Uint8List?> pickImageCrop(
  //     {required ImageSource imageSource, final int? compress}) async {
  //   var pickRes = await ImagePicker().pickImage(
  //     source: imageSource,
  //     preferredCameraDevice: CameraDevice.rear,
  //   );
  //   if (pickRes != null) {
  //     // CroppedFile? cropped = await ImageCropper.platform.cropImage(
  //     //     sourcePath: pickRes.path,
  //     //     maxHeight: 500,
  //     //     maxWidth: 500,
  //     //     aspectRatio: const CropAspectRatio(ratioX: 5, ratioY: 5),
  //     //     uiSettings: [
  //     //       AndroidUiSettings(
  //     //         cropStyle: CropStyle.rectangle,
  //     //         hideBottomControls: true,
  //     //       ),
  //     //       IOSUiSettings(
  //     //         cropStyle: CropStyle.rectangle,
  //     //         rectHeight: 500,
  //     //         rectWidth: 500,
  //     //       )
  //     //     ]);
  //     // if (cropped != null) {
  //     //   return File(cropped.path);
  //     // }
  //     return pickRes.readAsBytes();
  //   }
  //   return null;
  // }



  static Future<File?> getFile(
      {List<String> ext = const [], FileType? type}) async {
    final v = await FilePicker.platform.pickFiles(
        type: type ?? FileType.custom, allowedExtensions: ext, withData: true);
    if (v?.files.firstOrNull == null) {
      return null;
    }
    return File(
      v!.files.first.path!
    );
  }
}

class PickedFile {
  Uint8List bytes;
  String name;
  int size;

  PickedFile({
    required this.bytes,
    required this.size,
    required this.name,
  });
}
