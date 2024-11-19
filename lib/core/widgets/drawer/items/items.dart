import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:object_detection/core/themes/app_theme.dart';
import 'package:object_detection/core/widgets/drawer/items/item.dart';
import 'package:object_detection/presentation/home/controllers/home_controller.dart';

class DrawerItems extends GetView<HomeController> {
  const DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppTheme.colors.appPrimary,
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          child: HomeDrawerItem(
            title: "Camara AR".tr,
            padding: false,
            icon: FontAwesomeIcons.camera,
            onTap: () async {},
          ),
        ).paddingOnly(left: 30.w, right: 30.w),
      ],
    );
  }
}
