import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

// ignore: must_be_immutable
class ProfileImageSelector extends StatefulWidget {
  int? size;
  File? imageFile;
  final IconData icon;
  late Color? backgroundColor;
  late Color? iconColor;
  List<PlatformUiSettings>? platformUiSettings;

  //コンストラクタ
  ProfileImageSelector({
    Key? key,
    @required this.size,
    this.icon = Icons.person,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);
  @override
  ProfileImageSelectorState createState() => ProfileImageSelectorState();
}

class ProfileImageSelectorState extends State<ProfileImageSelector> {
  @override
  void initState() {
    super.initState();
    if (widget.size! < 30) {
      widget.size = 30;
    }
    widget.backgroundColor ??= Colors.grey;
    widget.iconColor ??= Colors.black;
  }

  //カメラロールから写真を取得し写真を切り取る
  Future<File?> _getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return null;
    }
    File? image = File(pickedFile.path);
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [CropAspectRatioPreset.square],
      sourcePath: image.path,
      compressQuality: 100,
      uiSettings: widget.platformUiSettings,
    );
    if (croppedFile == null) {
      return null;
    }
    File croppedImage = File(croppedFile.path);
    return croppedImage;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.imageFile == null
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: widget.backgroundColor,
              ),
              width: widget.size!.toDouble(),
              height: widget.size!.toDouble(),
              child: Icon(
                widget.icon,
                size: (widget.size! / 10) * 8,
                color: widget.iconColor,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: widget.backgroundColor,
              ),
              width: widget.size!.toDouble(),
              height: widget.size!.toDouble(),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.file(widget.imageFile!),
              ),
            ),
      onTap: () async {
        await _getImage().then((imagen) {
          if (imagen != null) {
            widget.imageFile = imagen;
          } else {
            widget.imageFile = null;
          }
        });
        setState(() {});
      },
    );
  }
}
