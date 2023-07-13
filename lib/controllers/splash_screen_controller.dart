import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:ocr/screens/home_screen.dart';
import 'package:ocr/widgets/custom_loader.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    doRedirection();
  }

  Future<void> doRedirection() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => HomeScreen());
  }
}
