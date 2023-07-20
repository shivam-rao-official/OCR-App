import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/controllers/image_to_text_controller.dart';

class IntegratedNotepad extends StatelessWidget {
  const IntegratedNotepad({super.key});

  static final _capturedTextController = Get.put(TextRecognizerController());

  static final _editorFocusNode = FocusNode();
  static final _editorTitleFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /**
             *  TEXTFIELD FOR THE EDITOR TITLE
             */
            TextFormField(
              onTap: () {
                _editorTitleFocusNode.hasFocus
                    ? _editorTitleFocusNode.unfocus()
                    : _editorTitleFocusNode.requestFocus();
              },
              onChanged: (updatedString) {},
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
            const SizedBox(height: 20),
            /**
             *  TEXTFIELD FOR THE MAIN EDITOR
             */
            TextFormField(
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
          ],
        ),
      ),
    );
  }
}
