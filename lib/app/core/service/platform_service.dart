import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class PlatformService {
  Future<Uri?> saveBackupFile({required Uint8List bytes}) async {
    final result = await FilePicker.saveFile(
      dialogTitle: 'Export Vocly words',
      fileName: 'vocly_backup.json',
      bytes: bytes,
      type: FileType.custom,
      allowedExtensions: ['json'],
      mimeType: 'application/json',
    );
    return result;
  }
}
