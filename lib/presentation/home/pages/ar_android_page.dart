// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:get/get.dart';
import 'package:object_detection/core/themes/app_theme.dart';
import 'package:object_detection/presentation/home/controllers/ar_controller.dart';
import 'package:vector_math/vector_math_64.dart' as vc;

class ARPageAndroid extends StatefulWidget {
  const ARPageAndroid({super.key});

  @override
  _ARPageAndroidState createState() => _ARPageAndroidState();
}

class _ARPageAndroidState extends State<ARPageAndroid> {
  late ArCoreController arCoreController;
  final ARController controller = Get.put(ARController());
  ArCoreNode? cubeNode;
  bool _isPlaneDetected = false;

  @override
  void dispose() {
    arCoreController.dispose();
    Get.delete<ARController>();
    super.dispose();
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneDetected = _onPlaneDetected;
    arCoreController.onPlaneTap = _handleOnPlaneTap;

    this.controller.rotation.listen((rotationValue) {
      if (cubeNode != null) {
        arCoreController.removeNode(nodeName: cubeNode!.name);

        final rotationQuaternion = vc.Quaternion.axisAngle(
          vc.Vector3(0, 1, 0),
          rotationValue,
        );

        cubeNode = ArCoreNode(
          name: 'cubeNode',
          shape: cubeNode!.shape,
          position: cubeNode!.position?.value,
          rotation: vc.Vector4(
            rotationQuaternion.x,
            rotationQuaternion.y,
            rotationQuaternion.z,
            rotationQuaternion.w,
          ),
        );

        arCoreController.addArCoreNodeWithAnchor(cubeNode!);
      }
    });
  }

  void _onPlaneDetected(ArCorePlane plane) {
    setState(() {
      _isPlaneDetected = true;
    });
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    if (cubeNode != null) {
      // Eliminar el cubo existente
      arCoreController.removeNode(nodeName: cubeNode!.name);

      cubeNode = ArCoreNode(
        name: 'cubeNode',
        shape: cubeNode!.shape,
        position: hit.pose.translation,
        rotation: cubeNode!.rotation?.value,
      );

      arCoreController.addArCoreNodeWithAnchor(cubeNode!);
    } else {
      _addCube(hit);
    }
  }

  void _addCube(ArCoreHitTestResult hit) {
    final material = ArCoreMaterial(
      color: AppTheme.colors.appSuccess,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vc.Vector3(0.2, 0.2, 0.2),
    );

    cubeNode = ArCoreNode(
      name: 'cubeNode',
      shape: cube,
      position: hit.pose.translation,
      rotation: hit.pose.rotation,
    );
    arCoreController.addArCoreNodeWithAnchor(cubeNode!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableTapRecognizer: true,
        ),
        if (!_isPlaneDetected)
          Positioned(
            top: 50,
            left: 10,
            right: 10,
            child: Container(
              color: Colors.black45,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Mueve tu dispositivo para detectar superficies',
                style: AppTheme.style.regular
                    .copyWith(color: AppTheme.colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        // Agregar botones para rotar el cubo
        Positioned(
          bottom: 50,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.rotation.value -= 0.2;
                },
                child: const Icon(Icons.rotate_left),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  controller.rotation.value += 0.2;
                },
                child: const Icon(Icons.rotate_right),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
