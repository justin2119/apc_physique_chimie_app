import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/exam_subject.dart';
import '../../domain/entities/subject_prompt_params.dart';
class SubjectGeneratorNotifier extends AsyncNotifier<List<ExamSubject>> {
 @override Future<List<ExamSubject>> build()=>Future.value([]);
 Future<void> generate(SubjectPromptParams p) async {state=const AsyncLoading(); state=await AsyncValue.guard(() async {return [];});}
}
final subjectGeneratorProvider=AsyncNotifierProvider<SubjectGeneratorNotifier,List<ExamSubject>>(SubjectGeneratorNotifier.new);
