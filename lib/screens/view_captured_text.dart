import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/controllers/firestore_controller.dart';
import 'package:ocr/widgets/custom_dialog.dart';
import 'package:ocr/widgets/integrated_notepad.dart';

class ViewCapturedTextPage extends StatelessWidget {
  const ViewCapturedTextPage({super.key});

  // static final _speechToTextController = Get.put(SpeechToTextController());
  static final _fireStoreController = Get.put(FireStoreController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await CustomDialog.showWarningWhileUnSavedData(context);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save_rounded),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(18.0),
          child: IntegratedNotepad(),
        ),
        // floatingActionButton: Obx(
        //   () => AvatarGlow(
        //     endRadius: 70.0,
        //     animate: _speechToTextController.isListening.value,
        //     glowColor: Colors.blue,
        //     showTwoGlows: true,
        //     repeat: true,
        //     duration: const Duration(milliseconds: 1500),
        //     repeatPauseDuration: const Duration(milliseconds: 10),
        //     curve: Curves.easeInOutCirc,
        //     child: GestureDetector(
        //       onTapDown: (v) async {
        //         await _speechToTextController.convertSpeechToText();
        //       },
        //       onTapUp: (v) {
        //         _speechToTextController.isListening.value = false;
        //         print(_speechToTextController.convertedTextFromSpeech.value);
        //         _capturedTextController.myText.value += _speechToTextController.convertedTextFromSpeech.value;

        //       },
        //       child: CircleAvatar(
        //         maxRadius: 30,
        //         backgroundColor: Colors.blue,
        //         child: Icon(
        //           _speechToTextController.isListening.value
        //               ? Icons.mic_outlined
        //               : Icons.mic_none_outlined,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
