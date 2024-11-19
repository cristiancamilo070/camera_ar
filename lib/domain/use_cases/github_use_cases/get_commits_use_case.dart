import 'package:dartz/dartz.dart';
import 'package:object_detection/domain/exceptions/base_exception.dart';
import 'package:object_detection/domain/models/commits_model.dart';
import 'package:object_detection/domain/repositories/github_repository.dart';
import 'package:object_detection/domain/use_cases/base_use_cases.dart';

class GetCommitsUseCase
    extends BaseUseCases<List<GitHubCommitModel>?, GetCommitsParams> {
  final GithubRepository _githubRepository;

  GetCommitsUseCase(this._githubRepository);

  @override
  Future<Either<BaseException, List<GitHubCommitModel>?>> execute(
      GetCommitsParams params) async {
    return _githubRepository.getCommits(owner: params.owner, repo: params.repo);
  }
}

class GetCommitsParams {
  final String owner;
  final String repo;

  GetCommitsParams(
    this.owner,
    this.repo,
  );
}
