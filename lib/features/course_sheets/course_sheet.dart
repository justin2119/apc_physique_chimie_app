import 'package:hive/hive.dart';

enum ClassLevel { seconde, premiere, terminale }
enum Discipline { physique, chimie }

class CourseSheet extends HiveObject {
  final String id, title, chapter, keyConcepts, formulasLatex, practicalApplications;
  final ClassLevel classLevel;
  final Discipline discipline;
  bool offlineSaved;
  CourseSheet({required this.id, required this.title, required this.classLevel, required this.discipline, required this.chapter, required this.keyConcepts, required this.formulasLatex, required this.practicalApplications, this.offlineSaved = true});
}

class CourseSheetAdapter extends TypeAdapter<CourseSheet> {
  @override final int typeId = 10;
  @override CourseSheet read(BinaryReader r) => CourseSheet(id:r.readString(), title:r.readString(), classLevel:ClassLevel.values[r.readInt()], discipline:Discipline.values[r.readInt()], chapter:r.readString(), keyConcepts:r.readString(), formulasLatex:r.readString(), practicalApplications:r.readString(), offlineSaved:r.readBool());
  @override void write(BinaryWriter w, CourseSheet s) { w..writeString(s.id)..writeString(s.title)..writeInt(s.classLevel.index)..writeInt(s.discipline.index)..writeString(s.chapter)..writeString(s.keyConcepts)..writeString(s.formulasLatex)..writeString(s.practicalApplications)..writeBool(s.offlineSaved); }
}
