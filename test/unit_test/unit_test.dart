import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:object_detection/presentation/home/controllers/home_controller.dart';

void main() {
  group('HomeController Test', () {
    late HomeController controller;

    setUp(() {
      controller = Get.put(HomeController());
    });

    tearDown(() {
      Get.delete<HomeController>();
    });

    test('Inicialización del controlador', () {
      expect(controller.advancedDrawerController, isNotNull);
    });

    test('Cambiar estado del drawer', () {
      controller.advancedDrawerController.showDrawer();
      expect(controller.advancedDrawerController.value.visible, isTrue);

      controller.advancedDrawerController.hideDrawer();
      expect(controller.advancedDrawerController.value.visible, isFalse);
    });
  });
}
