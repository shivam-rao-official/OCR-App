import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/controllers/image_to_text_controller.dart';
import 'package:ocr/widgets/custom_appbar.dart';
import 'package:ocr/widgets/custom_image_dialog.dart';

class HomeScreen extends StatelessWidget {

  var textRcognizerController = Get.put(TextRecognizerController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40), child: CustomAppbar()),
      body: Center(
        child: GetX<TextRecognizerController>(
          builder: (controller) {
            return controller.myText.value.isEmpty ? const Text(
              "No Texts Captured yet",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ): Text(controller.myText.value);
          }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        showAboutDialog(
            applicationName: "OCR Scanner",
            applicationVersion: "",
            context: context, children: [
          CustomImageDialog.showImageDialog(context),
        ]);
        },
        label: Row(
          children: const [
            Icon(Icons.camera_alt_outlined),
            SizedBox(width: 10),
            Text("Capture Text"),
          ],
        ),
      ),
    );
  }
}
