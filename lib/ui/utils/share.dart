import 'dart:io';

// import 'package:share_plus/share_plus.dart';
import 'package:hotel_r/ui/global_widgets/dialogs.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

// Future<ShareResultStatus> sharedPhoto(String filePath, {String? message}) async {
//   final res = await Share.shareXFiles([XFile(filePath)], text: message ?? 'Great picture');
//   return res.status;
// }

openFileLocal({required String file}) async {
  await permissionExternalStorager();
  try {
    await OpenFile.open(file, type: selectType(type: '.${file.split('.').last}'));
  } catch (e) {
    doneDialodOk(message: e.toString());
    return;
  }
}

String selectType({required String type}) {
  if (Platform.isAndroid) {
    return namedFileAndroid[type] ?? namedFileAndroid.values.toList()[6];
  }

  return nameFileIos[type] ?? nameFileIos.values.toList()[6];
}

Future permissionExternalStorager() async {
  final isEnable = await ph.Permission.manageExternalStorage.isGranted;
  final isEnableStorage = await ph.Permission.storage.isGranted;
  if (!isEnable) {
    await ph.Permission.manageExternalStorage.request();
  }
  if (!isEnableStorage) {
    await ph.Permission.storage.request();
  }
}

final namedFileAndroid = {
  ".csv": "application/vnd.ms-excel",
  ".doc": "application/msword",
  ".docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  ".gif": "image/gif",
  ".jpeg": "image/jpeg",
  ".jpg": "image/jpeg",
  ".pdf": "application/pdf",
  ".png": "image/png",
  ".txt": "text/plain",
};

final nameFileIos = {
  ".txt": "public.plain-text",
  ".jpg": "public.jpeg",
  ".jpeg": "public.jpeg",
  ".png": "public.png",
  ".gif": "com.compuserve.gif",
  ".doc": "com.microsoft.word.doc",
  ".pdf": "com.adobe.pdf"
};
