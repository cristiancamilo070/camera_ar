import 'package:get/get.dart';
import 'package:object_detection/presentation/home/controllers/ar_controller.dart';

class ARBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ARController());
  }
}
