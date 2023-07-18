import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/controllers/image_to_text_controller.dart';
import 'package:ocr/widgets/custom_dialog.dart';
import 'package:ocr/widgets/custom_loader.dart';

class ViewCapturedTextPage extends StatelessWidget {
  const ViewCapturedTextPage({super.key});

  static final _capturedTextController = Get.put(TextRecognizerController());
  static final _focusNode = FocusNode();



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
              icon: const Icon(Icons.save_alt_outlined),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextFormField(
            initialValue: _capturedTextController.myText.value,
            onTap: () {
              _focusNode.hasFocus
                  ? _focusNode.unfocus()
                  : _focusNode.requestFocus();
            },
            onChanged: (updatedString) {
              _capturedTextController.myText.value = updatedString;
            },
            focusNode: _focusNode,
            enableInteractiveSelection: true,
            enableSuggestions: true,
            maxLines: 99999,
            cursorHeight: 30,
            style: const TextStyle(fontSize: 25),
            decoration: const InputDecoration.collapsed(hintText: ""),
          ),
        ),
      ),
    );
  }
}
