import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/controllers/image_to_text_controller.dart';

class CustomDialog {
  static final _textRecognizedController = Get.put(TextRecognizerController());
  static Future showImageDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _showButtons(Icons.camera_alt_outlined, 25, 20, "CAMERA",
                      ImageSource.camera),
                  _showButtons(Icons.image_outlined, 25, 20, "GALLERY",
                      ImageSource.gallery),
                ],
              ),
            ),
          );
        });
  }

  static Widget _showButtons(IconData icons, double iconSize, double fontSize,
      String text, ImageSource imageSource) {
    return MaterialButton(
      onPressed: () {
        Get.back();
        _textRecognizedController.pickImage(imageSource);
      },
      child: Column(
        children: [
          Icon(
            icons,
            size: iconSize,
          ),
          const Spacer(),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }


  static showWarningWhileUnSavedData(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (builder) {
          return AlertDialog(
            alignment: Alignment.center,
            title: const Text("Warning"),
            content: const Text(
                "Please save your work before exit. Otherwise your data will get lose."),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("CANCEL")),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text("EXIT")),
            ],
          );
        });
  }
}
