import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/controllers/firestore_controller.dart';
import 'package:ocr/controllers/image_to_text_controller.dart';
import 'package:ocr/widgets/custom_appbar.dart';
import 'package:ocr/widgets/custom_dialog.dart';

class HomeScreen extends StatelessWidget {
  var textRecognizerController = Get.put(TextRecognizerController());
  var fireStoreController = Get.put(FireStoreController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40), child: CustomAppbar()),
      body: const Center(
          child: Text(
        "No Texts Captured yet",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black54,
          fontWeight: FontWeight.w400,
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          CustomDialog.showImageDialog(context);
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
