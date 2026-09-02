import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/problem_situation.dart';
abstract interface class ProblemSituationRepository {
  Future<Either<Failure, List<ProblemSituation>>> getAll();
}
