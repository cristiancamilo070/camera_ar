import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:object_detection/core/controllers/main_controller.dart';
import 'package:object_detection/core/routes/app_routes.dart';
import 'package:object_detection/core/themes/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SafeArea(
          bottom: true,
          child: Obx(() {
            final isReady = _controller.isReadyDependencies.value;

            if (isReady) {
              Future.delayed(const Duration(seconds: 2), () {
                Get.offAllNamed(RoutesPaths.homePage);
              });
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ZoomIn(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppTheme.colors.appPrimary.withOpacity(0.9),
                                  AppTheme.colors.appSecondary.withOpacity(0.7),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            child: SizedBox(
                              height: 90,
                              width: 90,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.cameraRotate,
                                  color: AppTheme.colors.white,
                                  size: 70,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'AR App',
                          style: AppTheme.style.bold.copyWith(
                            color: AppTheme.colors.appPrimary,
                            fontSize: AppTheme.fontSize.f22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  _controller.versionApp,
                  style: AppTheme.style.regular.copyWith(
                    color: AppTheme.colors.appSecondary,
                    fontSize: AppTheme.fontSize.f12,
                  ),
                ),
                Text(
                  'By: Cristian Cruz',
                  style: AppTheme.style.regular.copyWith(
                    color: AppTheme.colors.appTertiary,
                    fontSize: AppTheme.fontSize.f12,
                  ),
                ).paddingOnly(
                  bottom: 40.w,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
