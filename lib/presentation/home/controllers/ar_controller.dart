import 'package:get/get.dart';
import 'package:object_detection/core/controllers/base_getx_controller.dart';

class ARController extends BaseGetxController {
  // Observables
  var isObjectDetected = false.obs;
  var rotation = 0.0.obs;
  DateTime? lastUpdateTime;

  void onObjectDetected() {
    isObjectDetected.value = true;
  }
}
