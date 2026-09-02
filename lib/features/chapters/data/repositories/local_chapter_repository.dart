import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/chapter.dart';
import '../../domain/repositories/chapter_repository.dart';
final class LocalChapterRepository implements ChapterRepository {
  @override
  Future<Either<Failure, List<Chapter>>> getAll() async => const Right([]);
}
