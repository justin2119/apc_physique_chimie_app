class SubjectPromptParams {
  final String targetClass, discipline, chapter, difficulty;
  final bool includeSolution;
  final int duration;
  const SubjectPromptParams({required this.targetClass, required this.discipline, required this.chapter, this.difficulty = 'moyen', this.includeSolution = true, this.duration = 120});
}
