import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class TextRecognizerController extends GetxController {
  static final _imagePicker = ImagePicker();
  var myText = "".obs;

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      // textScanning = true;
      myText.value = "";
      getTextFromImage(pickedImage);
    }
  }

  Future<void> getTextFromImage(XFile? image) async {
    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    final inputImage = InputImage.fromFilePath(image!.path);

    RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    await textRecognizer.close();

    for(TextBlock block in recognizedText.blocks){
      for(TextLine lines in block.lines){
        myText.value += "${lines.text} \n";
      }
    }
  }
}