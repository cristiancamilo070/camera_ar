// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detection/core/themes/app_theme.dart';
import 'package:object_detection/presentation/home/controllers/ar_controller.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vc;

class ARPageIOS extends StatefulWidget {
  const ARPageIOS({super.key});

  @override
  _ARPageIOSState createState() => _ARPageIOSState();
}

class _ARPageIOSState extends State<ARPageIOS> {
  late ARKitController arkitController;
  final ARController controller = Get.put(ARController());
  late ARKitNode cubeNode;
  double accumulatedRotation = 0.0;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  void _onARKitViewCreated(ARKitController controller) {
    arkitController = controller;
    _addCube();

    this.controller.rotation.listen((rotationValue) {
      setState(() {
        accumulatedRotation += rotationValue;
        cubeNode.eulerAngles = vc.Vector3(0, accumulatedRotation, 0);
      });
    });
  }

  void _addCube() {
    final material = ARKitMaterial(
      diffuse: ARKitMaterialProperty.color(Colors.blue),
    );
    final cube = ARKitBox(
      materials: [material],
      width: 0.2,
      height: 0.2,
      length: 0.2,
    );
    cubeNode = ARKitNode(
      geometry: cube,
      position: vc.Vector3(0, 0, -0.5),
    );
    arkitController.add(cubeNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realidad Aumentada - iOS'),
        backgroundColor: AppTheme.colors.appPrimary,
      ),
      body: ARKitSceneView(
        onARKitViewCreated: _onARKitViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }
}
