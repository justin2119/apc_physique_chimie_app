import 'dart:convert';
import 'dart:io';
import '../../domain/entities/subject_prompt_params.dart';
import '../models/exam_subject_model.dart';
class RemoteAiDatasource {
 final Uri endpoint; final String apiKey;
 RemoteAiDatasource({required this.endpoint,this.apiKey='' });
 String prompt(SubjectPromptParams p)=>'''Tu es un enseignant togolais expert du programme officiel APC. Génère un sujet d'examen JSON strict pour ${p.targetClass}, ${p.discipline}, chapitre ${p.chapter}, difficulté ${p.difficulty}, durée ${p.duration} minutes. Utilise uniquement le programme Physique-Chimie du Togo, une situation-problème locale authentique, des consignes progressives et les critères CM1, CM2, CM3, CP. Toutes les formules doivent être en LaTeX. Retourne uniquement: id,title,targetClass,discipline,chapter,contextProblem,questions (liste),criteria (liste),markingScheme,solution,createdAt. Solution incluse: ${p.includeSolution}.''';
 Future<ExamSubjectModel> generate(SubjectPromptParams p) async { final c=HttpClient(); try { final req=await c.postUrl(endpoint).timeout(const Duration(seconds:30)); req.headers.contentType=ContentType.json; if(apiKey.isNotEmpty) req.headers[HttpHeaders.authorizationHeader]='Bearer $apiKey'; req.write(jsonEncode({'model':'gpt-4o-mini','messages':[{'role':'user','content':prompt(p)}],'response_format':{'type':'json_object'}})); final r=await req.close().timeout(const Duration(seconds:30)); final body=await r.transform(utf8.decoder).join(); if(r.statusCode>=400) throw HttpException('AI API ${r.statusCode}'); final decoded=jsonDecode(body); final content=decoded['choices']?[0]?['message']?['content']??body; return ExamSubjectModel.fromJson(jsonDecode(content)); } finally {c.close();} }
}
