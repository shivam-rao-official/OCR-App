import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextController extends GetxController{
  var isListening = false.obs;
  var isAudioPermissionEnable = false.obs;

  var convertedTextFromSpeech = "".obs;




  convertSpeechToText() async {
    SpeechToText speechToText = SpeechToText();
    isListening.value = true;
    convertedTextFromSpeech.value = "";
    var available = await speechToText.initialize();
    if (available) {
      speechToText.listen(onResult: (result) {
        convertedTextFromSpeech.value =
            result.recognizedWords;
      });
    }

  }
}