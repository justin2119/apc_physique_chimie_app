import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/chapter.dart';
abstract interface class ChapterRepository {
  Future<Either<Failure, List<Chapter>>> getAll();
}
