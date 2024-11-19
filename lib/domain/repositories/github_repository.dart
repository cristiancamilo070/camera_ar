import 'package:dartz/dartz.dart';
import 'package:object_detection/domain/exceptions/base_exception.dart';
import 'package:object_detection/domain/models/commit_blob_model.dart';
import 'package:object_detection/domain/models/commit_tree_model.dart';
import 'package:object_detection/domain/models/commits_model.dart';

abstract class GithubRepository {
  Future<Either<BaseException, List<GitHubCommitModel>?>> getCommits({
    required String owner,
    required String repo,
  });
  Future<Either<BaseException, CommitTreeModel?>> getCommitTree({
    required String url,
  });
  Future<Either<BaseException, CommitBlobModel?>> getCommitBlob({
    required String url,
  });
}
