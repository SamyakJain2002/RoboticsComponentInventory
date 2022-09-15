import 'package:image/image.dart' as Im;
import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';

Future<File> compressImage(File imagetoComapress) async {
  final tempdir = await getTemporaryDirectory();
  final path = tempdir.path;

  int random = Random().nextInt(1000);

  Im.Image image = Im.decodeImage(imagetoComapress.readAsBytesSync());
  Im.copyResize(image, width: 500, height: 500);
  File temp = File('$path/img_$random.jpg')
    ..writeAsBytesSync(Im.encodeJpg(image));
  final bytes = temp.readAsBytesSync().lengthInBytes;
  final kb = bytes / 1024;
  print("kb: $kb");

  return temp
    ..writeAsBytesSync(Im.encodeJpg(image,
        quality: (kb >= 400)
            ? (kb >= 1000)
                ? 20
                : 40
            : 80));
}
