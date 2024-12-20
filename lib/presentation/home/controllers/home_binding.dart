import 'package:get/get.dart';
import 'package:object_detection/domain/repositories/github_repository.dart';
import 'package:object_detection/domain/use_cases/github_use_cases/get_commit_blob_use_case.dart';
import 'package:object_detection/domain/use_cases/github_use_cases/get_commit_tree_use_case.dart';
import 'package:object_detection/domain/use_cases/github_use_cases/get_commits_use_case.dart';
import 'package:object_detection/presentation/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());

    Get.lazyPut(
      () => GetCommitsUseCase(
        Get.find<GithubRepository>(),
      ),
    );
    Get.lazyPut(
      () => GetCommitBlobUseCase(
        Get.find<GithubRepository>(),
      ),
    );
    Get.lazyPut(
      () => GetCommitTreeUseCase(
        Get.find<GithubRepository>(),
      ),
    );
  }
}
