import 'dart:convert';
import 'package:hive/hive.dart';
import '../models/exam_subject_model.dart';
class LocalSubjectDatasource {
 final Box<String> box;
 LocalSubjectDatasource(this.box);
 Future<void> save(ExamSubjectModel subject)=>box.put(subject.id,jsonEncode(subject.toJson()));
 List<ExamSubjectModel> getAll()=>box.values.map((v)=>ExamSubjectModel.fromJson(jsonDecode(v) as Map<String,dynamic>)).toList();
}
