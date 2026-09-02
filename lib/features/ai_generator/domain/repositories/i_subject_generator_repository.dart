import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/exam_subject.dart';
import '../entities/subject_prompt_params.dart';
abstract class ISubjectGeneratorRepository {
 Future<Either<Failure, ExamSubject>> generateSubject(SubjectPromptParams params);
 Future<Either<Failure, Unit>> saveSubject(ExamSubject subject);
 Future<Either<Failure, List<ExamSubject>>> getSavedSubjects();
}
