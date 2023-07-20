import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ocr/screens/view_captured_text.dart';
import 'package:ocr/widgets/custom_loader.dart';

class TextRecognizerController extends GetxController {
  static final _imagePicker = ImagePicker();
  var myText = "".obs;
  var title = "".obs;

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await _imagePicker.pickImage(
        source: source,
        requestFullMetadata: false,
        preferredCameraDevice: CameraDevice.rear);
    if (pickedImage != null) {
      
      myText.value = "";
      getTextFromImage(pickedImage);
    }
  }

  Future<void> getTextFromImage(XFile? image) async {
    CustomLoader.showLoadingDialog("Fetching texts from image");
    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    final inputImage = InputImage.fromFilePath(image!.path);

    RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    await textRecognizer.close();

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine lines in block.lines) {
        myText.value += lines.text;
      }
    }

    CustomLoader.hideLoadingDialog();
    Get.to(() => ViewCapturedTextPage());
  }
}
