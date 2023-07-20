import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/controllers/firestore_controller.dart';
import 'package:ocr/controllers/image_to_text_controller.dart';
import 'package:ocr/controllers/speech_to_text_controller.dart';
import 'package:ocr/model/notes_model.dart';
import 'package:ocr/widgets/custom_dialog.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ViewCapturedTextPage extends StatelessWidget {
  ViewCapturedTextPage({super.key});

  static final _speechToTextController = Get.put(SpeechToTextController());
  static final _capturedTextController = Get.put(TextRecognizerController());

  static final _editorFocusNode = FocusNode();
  static final _editorTitleFocusNode = FocusNode();

  static final SpeechToText speechToText = SpeechToText();

  var controller =
      TextEditingController(text: _capturedTextController.myText.value);

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
              onPressed: () {
                FireStoreController.doInsert(
                  "notes",
                  Notes(
                    notes: _capturedTextController.myText.value,
                    title: _capturedTextController.title.value,
                    createdOn: DateTime.now().toString(),
                  ),
                );
              },
              icon: const Icon(Icons.save_rounded),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /**
                 *  TEXTFIELD FOR THE EDITOR TITLE
                 */
                Obx(
                  () => TextFormField(
                    initialValue:
                        _speechToTextController.convertedTextFromSpeech.value,
                    onTap: () {
                      _editorTitleFocusNode.hasFocus
                          ? _editorTitleFocusNode.unfocus()
                          : _editorTitleFocusNode.requestFocus();
                    },
                    onChanged: (updatedString) {
                      _capturedTextController.title.value = updatedString;
                    },
                    focusNode: _editorTitleFocusNode,
                    enableInteractiveSelection: true,
                    enableSuggestions: true,
                    cursorHeight: 20,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      hintText: "Title",
                    ),
                    // decoration: const InputDecoration.collapsed(hintText: ""),
                  ),
                ),
                const SizedBox(height: 20),
                /**
                 *  TEXTFIELD FOR THE MAIN EDITOR
                 */
                Obx(
                  () => TextFormField(
                    initialValue: _capturedTextController.myText.value,
                    onTap: () {
                      _editorFocusNode.hasFocus
                          ? _editorFocusNode.unfocus()
                          : _editorFocusNode.requestFocus();
                    },
                    onChanged: (updatedString) {
                      _capturedTextController.myText.value = updatedString;
                    },
                    // textAlign: TextAlign.justify,
                    focusNode: _editorFocusNode,
                    enableInteractiveSelection: true,
                    enableSuggestions: true,
                    maxLines: 50,
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration.collapsed(hintText: ""),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Obx(
          () => GestureDetector(
            onTapDown: (v) async {
              _speechToTextController.isListening.value = true;
              _speechToTextController.convertedTextFromSpeech.value = "";
              var available = await speechToText.initialize();
              if (available) {
                speechToText.listen(onResult: (result) {
                  _speechToTextController.convertedTextFromSpeech.value =
                      result.recognizedWords;
                });
              }
            },
            onTapUp: (v) {
              _speechToTextController.isListening.value = false;
              speechToText.stop();
              _capturedTextController.myText.value +=
                  _speechToTextController.convertedTextFromSpeech.value;
              print(_capturedTextController.myText.value);
            },
            child: AvatarGlow(
              endRadius: 70.0,
              animate: _speechToTextController.isListening.value,
              glowColor: Colors.blue,
              showTwoGlows: true,
              repeat: true,
              duration: const Duration(milliseconds: 1500),
              repeatPauseDuration: const Duration(milliseconds: 10),
              curve: Curves.easeInOutCirc,
              child: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.blue,
                child: Icon(
                  _speechToTextController.isListening.value
                      ? Icons.mic_outlined
                      : Icons.mic_none_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
