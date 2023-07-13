import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/controllers/image_to_text_controller.dart';

class CustomImageDialog {
  static final _textRecognizedController = Get.put(TextRecognizerController());
  static Widget showImageDialog(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width / 3,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _showButtons(Icons.camera_alt_outlined, "CAMERA", ImageSource.camera),
            _showButtons(Icons.image, "GALLERY", ImageSource.gallery),
          ],
        ),
      ),
    );
  }


  static Widget _showButtons(IconData icons, String text, ImageSource imageSource) {
    return MaterialButton(
      onPressed: (){
        _textRecognizedController.pickImage(imageSource);
      },
      child: Column(
        children: [
          Icon(icons),
          Text(text),
        ],
      ),
    );
  }
}


