import 'dart:convert';
import 'dart:io';
import '../../domain/entities/subject_prompt_params.dart';
import '../models/exam_subject_model.dart';

class RemoteAiDatasource {
  final Uri endpoint;
  final String apiKey;
  RemoteAiDatasource({required this.endpoint, this.apiKey = ''});

  String prompt(SubjectPromptParams p) => '''
Tu es un enseignant togolais expert du programme officiel APC de Physique-Chimie.
Génère un sujet d'examen JSON strict pour ${p.targetClass}, ${p.discipline}, chapitre ${p.chapter}, difficulté ${p.difficulty}, durée ${p.duration} minutes.

CANVAS OBLIGATOIRE DU SUJET TOGOLAIS :
1) En-tête à deux colonnes : à gauche institution/lycée, année scolaire, type d'évaluation (Évaluation sommative, Devoir ou Composition) ; à droite devise, « Discipline : Sciences Physiques », classe, durée et coefficient.
2) Le sujet comporte exactement quatre exercices principaux, dans cet ordre :
   - EXERCICE 1 — CHIMIE : chimie organique, nomenclature, dosages, équations-bilans et calculs guidés.
   - EXERCICE 2 — CHIMIE / PHYSIQUE : oxydoréduction, piles électrochimiques, cinétique ou électrostatique.
   - EXERCICE 3 — PHYSIQUE : optique, champ électrostatique, cinématique/dynamique, avec schémas si nécessaires et questions guidées.
   - EXERCICE 4 — SITUATION D'ÉVALUATION APC : contexte-problème authentique ancré dans l'environnement togolais/local, consignes structurées et grille critériée.
3) Chaque question doit avoir un barème explicite et précis par sous-point. L'exercice 4 doit ventiler le barème selon CM1 (Pertinence), CM2 (Utilisation correcte des outils), CM3 (Cohérence) et CP (Perfectionnement), avec critères observables.
4) Ajouter en fin de sujet une section « Données / Constantes » : masses molaires atomiques utiles, F, e, N_A, g = 9,81 m/s² et autres constantes réellement utilisées, puis la mention « Bonne Chance ».
5) Toutes les grandeurs, unités, équations et expressions mathématiques doivent être en LaTeX (délimiteurs \\( ... \\) ou \\[ ... \\]). N'invente pas de constantes inutilisées.

Le JSON doit contenir uniquement les champs : id,title,targetClass,discipline,chapter,header,exercises,constants,contextProblem,questions,criteria,markingScheme,solution,createdAt.
`header` doit contenir institution, academicYear, examType, motto, discipline, className, duration et coefficient.
`exercises` doit être une liste de longueur exactement 4, chaque élément ayant number, title, domain, statement, questions et markingScheme. `criteria` doit expliciter CM1, CM2, CM3 et CP. Les questions doivent conserver les allocations de points détaillées. Inclure la solution : ${p.includeSolution}.
Retourne uniquement un objet JSON valide, sans Markdown ni texte avant/après.
''';

  Future<ExamSubjectModel> generate(SubjectPromptParams p) async {
    final c = HttpClient();
    try {
      final req = await c.postUrl(endpoint).timeout(const Duration(seconds: 30));
      req.headers.contentType = ContentType.json;
      if (apiKey.isNotEmpty) req.headers[HttpHeaders.authorizationHeader] = 'Bearer $apiKey';
      req.write(jsonEncode({'model': 'gpt-4o-mini', 'messages': [{'role': 'user', 'content': prompt(p)}], 'response_format': {'type': 'json_object'}}));
      final r = await req.close().timeout(const Duration(seconds: 30));
      final body = await r.transform(utf8.decoder).join();
      if (r.statusCode >= 400) throw HttpException('AI API ${r.statusCode}');
      final decoded = jsonDecode(body);
      final content = decoded['choices']?[0]?['message']?['content'] ?? body;
      return ExamSubjectModel.fromJson(jsonDecode(content));
    } finally {
      c.close();
    }
  }
}
