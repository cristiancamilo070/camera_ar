// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'package:get/get.dart';
import 'package:object_detection/core/controllers/base_getx_controller.dart';
import 'package:object_detection/domain/models/commits_model.dart';

class HomeController extends BaseGetxController {
  final advancedDrawerController = AdvancedDrawerController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController repoController = TextEditingController();

  Rx<List<GitHubCommitModel>?> listOfCommits = Rx(null);
  RxString ownerTitle = 'cristiancamilo070'.obs;
  RxString repoTitle = 'github_commit_history'.obs;
  RxBool commitError = false.obs;
  RxBool commitLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
