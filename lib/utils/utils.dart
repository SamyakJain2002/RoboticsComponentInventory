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
  return File('$path/img_$random.jpg')
    ..writeAsBytesSync(Im.encodeJpg(image, quality: 40));
}
