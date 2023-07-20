import 'package:get/get.dart';
import 'package:ocr/controllers/image_to_text_controller.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextController extends GetxController{
  var isListening = false.obs;
  var isAudioPermissionEnable = false.obs;

  var convertedTextFromSpeech = "".obs;

  static var _capturedTextFromImage = Get.put(TextRecognizerController());



  convertSpeechToText() async {
    SpeechToText speechToText = SpeechToText();
    isListening.value = true;
    convertedTextFromSpeech.value = "";
    var available = await speechToText.initialize();
    print("=================================> Listening");
    if (available) {
      speechToText.listen(onResult: (result) {
        convertedTextFromSpeech.value =
            result.recognizedWords;
      });
    }

  }
}