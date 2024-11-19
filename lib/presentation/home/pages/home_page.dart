import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:object_detection/core/routes/app_routes.dart';
import 'package:object_detection/core/themes/app_theme.dart';
import 'package:object_detection/core/widgets/animations/animations.dart';
import 'package:object_detection/core/widgets/buttons/primary_button.dart';
import 'package:object_detection/core/widgets/drawer/drawer.dart';
import 'package:object_detection/core/widgets/drawer/navbar.dart';
import 'package:object_detection/presentation/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final homeAnimationsController = Get.put(HomeAnimationsController());

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    startHomeAnimations();
    return AdvancedDrawer(
      backdropColor: AppTheme.colors.appTertiary,
      controller: controller.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openRatio: 0.66,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.r)),
      ),
      drawer: const HomeDrawer(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.colors.white,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  AppTheme.colors.white,
                  AppTheme.colors.white.withOpacity(0.3),
                  AppTheme.colors.appSecondary.withOpacity(0.2),
                  AppTheme.colors.white.withOpacity(0.3),
                  AppTheme.colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    HomeNavbar(),
                  ],
                ),
                body(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Texto de instrucciones generales
          Text(
            'Instrucciones para usar la cámara AR:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0, // Tamaño más grande para el título
              fontWeight: FontWeight.bold,
              color: AppTheme.colors.appSecondary,
            ),
          ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
          // Lista de pasos
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              stepItem(
                  '1. Asegúrate de estar en un lugar con buena iluminación.'),
              heightSpace20,
              stepItem(
                  '2. Mueve el dispositivo lentamente para detectar superficies.'),
              heightSpace20,
              stepItem(
                  '3. Una vez que se detecte una superficie, selecciona un punto.'),
              heightSpace20,
              stepItem(
                  '4. Aparecerá un cubo en el punto seleccionado. Puedes moverlo tocando en otra área.'),
              heightSpace20,
              stepItem('5. Usa los botones inferiores para rotar el cubo.'),
            ],
          ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
          const Spacer(),
          PrimaryButton(
            onPressed: () {
              if (Platform.isAndroid) {
                Get.toNamed(
                  RoutesPaths.arAndroidPage,
                );
              } else {
                Get.toNamed(
                  RoutesPaths.arIosPage,
                );
              }
            },
            text: 'Presiona para abrir la cámara',
          ).paddingSymmetric(horizontal: 16.w, vertical: 16.h),
        ],
      ),
    );
  }

  Widget stepItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle,
          color: AppTheme.colors.appPrimary,
          size: 20,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: AppTheme.colors.appSecondary,
            ),
          ),
        ),
      ],
    ).paddingOnly(bottom: 8.h, left: 20.w);
  }
}
