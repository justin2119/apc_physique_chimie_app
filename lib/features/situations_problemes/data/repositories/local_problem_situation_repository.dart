import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/problem_situation.dart';
import '../../domain/repositories/problem_situation_repository.dart';
final class LocalProblemSituationRepository implements ProblemSituationRepository {
  @override
  Future<Either<Failure, List<ProblemSituation>>> getAll() async => const Right([]);
}
