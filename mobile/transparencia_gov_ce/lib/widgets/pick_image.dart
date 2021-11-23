import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  final File selectedImage;
  final Function(File imagem) setImage;

  const CameraScreen({
    required this.selectedImage,
    required this.setImage,
  });

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final picker = ImagePicker();
  bool _inProcess = false;

  getImage(ImageSource src) async {
    this.setState(() {
      _inProcess = true;
    });
    final pickedFile = await picker.getImage(source: src);
    if (pickedFile != null) {
      File cropped = await ImageCropper.cropImage(
        aspectRatioPresets: Platform.isAndroid
            ? [CropAspectRatioPreset.square]
            : [CropAspectRatioPreset.square],
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Imagem',
          lockAspectRatio: true,
          initAspectRatio: CropAspectRatioPreset.square,
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Imagem',
        ),
      );
      widget.setImage(cropped);
      setState(() {
        _inProcess = false;
      });
    } else {
      setState(() {
        _inProcess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if ((_inProcess)) {
      return Container(
        color: Colors.white,
        // height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            strokeWidth: 5.0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
      );
    } else {
      return Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        alignment: Alignment.bottomRight,
        children: <Widget>[
          widget.selectedImage != null
              ? Image.file(
                  widget.selectedImage,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : Container(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  width: 250,
                  height: 250,
                  child: Icon(
                    Icons.camera_alt,
                    size: 200,
                    color: Colors.grey,
                  ),
                ),
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.photo),
                      Container(width: 4),
                      Text('Galeria'),
                    ],
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.photo_camera),
                      Container(width: 4),
                      Text('Câmera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
