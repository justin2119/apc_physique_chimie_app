import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/exam_subject.dart';
import '../../domain/entities/subject_prompt_params.dart';
import '../../domain/repositories/i_subject_generator_repository.dart';
import '../datasources/local_subject_datasource.dart';
import '../datasources/remote_ai_datasource.dart';
import '../models/exam_subject_model.dart';
class SubjectGeneratorRepositoryImpl implements ISubjectGeneratorRepository {
 final RemoteAiDatasource remote; final LocalSubjectDatasource local;
 SubjectGeneratorRepositoryImpl(this.remote,this.local);
 Future<Either<Failure,ExamSubject>> generateSubject(SubjectPromptParams p) async {try{return Right(await remote.generate(p));}catch(e){return Left(Failure('Génération indisponible: $e'));}}
 Future<Either<Failure,Unit>> saveSubject(ExamSubject s) async {try{await local.save(ExamSubjectModel.fromJson({...ExamSubjectModel.fromJson({'id':s.id}).toJson(),...{'id':s.id,'title':s.title,'targetClass':s.targetClass,'discipline':s.discipline,'chapter':s.chapter,'contextProblem':s.contextProblem,'questions':s.questions,'criteria':s.criteria,'markingScheme':s.markingScheme,'solution':s.solution,'createdAt':s.createdAt.toIso8601String(),'isSavedOffline':true}}));return const Right(unit);}catch(e){return Left(Failure('Sauvegarde impossible: $e'));}}
 Future<Either<Failure,List<ExamSubject>>> getSavedSubjects() async {try{return Right(local.getAll());}catch(e){return Left(Failure('Lecture hors-ligne impossible: $e'));}}
}
