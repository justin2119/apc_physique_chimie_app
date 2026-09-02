class ExamSubject {
  final String id, title, targetClass, discipline, chapter, contextProblem, markingScheme, solution;
  final List<String> questions, criteria;
  final DateTime createdAt;
  final bool isSavedOffline;
  const ExamSubject({required this.id, required this.title, required this.targetClass, required this.discipline, required this.chapter, required this.contextProblem, required this.questions, required this.criteria, required this.markingScheme, required this.solution, required this.createdAt, this.isSavedOffline = false});
  ExamSubject copyWith({bool? isSavedOffline}) => ExamSubject(id:id,title:title,targetClass:targetClass,discipline:discipline,chapter:chapter,contextProblem:contextProblem,questions:questions,criteria:criteria,markingScheme:markingScheme,solution:solution,createdAt:createdAt,isSavedOffline:isSavedOffline??this.isSavedOffline);
}
