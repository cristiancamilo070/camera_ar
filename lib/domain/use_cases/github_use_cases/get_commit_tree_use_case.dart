import 'package:dartz/dartz.dart';
import 'package:object_detection/domain/exceptions/base_exception.dart';
import 'package:object_detection/domain/models/commit_tree_model.dart';
import 'package:object_detection/domain/repositories/github_repository.dart';
import 'package:object_detection/domain/use_cases/base_use_cases.dart';

class GetCommitTreeUseCase
    extends BaseUseCases<CommitTreeModel?, GetCommitTreeParams> {
  final GithubRepository _githubRepository;

  GetCommitTreeUseCase(this._githubRepository);

  @override
  Future<Either<BaseException, CommitTreeModel?>> execute(
      GetCommitTreeParams params) async {
    return _githubRepository.getCommitTree(url: params.url);
  }
}

class GetCommitTreeParams {
  final String url;

  GetCommitTreeParams(
    this.url,
  );
}
