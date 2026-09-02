import 'package:hive/hive.dart';
import 'course_sheet.dart';
final preloadedCourseSheets = <CourseSheet>[
 CourseSheet(id:'cinematique',title:'Cinématique du point matériel',classLevel:ClassLevel.terminale,discipline:Discipline.physique,chapter:'Mouvement',keyConcepts:'Trajectoire, vitesse, accélération, équations horaires, champ de pesanteur.',formulasLatex:'v = dx/dt ; a = dv/dt ; g ≈ 9.81 m/s²',practicalApplications:'Lancement de projectile au champ de tir de Lomé ou Vogan.'),
 CourseSheet(id:'newton',title:'Dynamique et lois de Newton',classLevel:ClassLevel.terminale,discipline:Discipline.physique,chapter:'Dynamique',keyConcepts:'Référentiel galiléen, forces, inertie, quantité de mouvement.',formulasLatex:'ΣF⃗ = m a⃗ ; action = − réaction',practicalApplications:'Étude du mouvement d’un véhicule et des systèmes mécaniques.'),
 CourseSheet(id:'ph',title:'Réactions acide-base et pH-métrie',classLevel:ClassLevel.terminale,discipline:Discipline.chimie,chapter:'Acides et bases',keyConcepts:'Définition de Brönsted, couples acide/base, autoprotolyse de l’eau.',formulasLatex:'pH = pKa + log([A⁻]/[AH]) ; Ke = [H₃O⁺][HO⁻]',practicalApplications:'Dosage du vinaigre commercial ou d’un jus local.'),
 CourseSheet(id:'organique',title:'Chimie organique',classLevel:ClassLevel.premiere,discipline:Discipline.chimie,chapter:'Composés organiques',keyConcepts:'Alcanes, alcools, groupes fonctionnels, estérification.',formulasLatex:'R–COOH + R′–OH ⇌ R–COOR′ + H₂O',practicalApplications:'Parfums, savons, biocarburants et transformation des produits locaux.'),
];
Future<Box<CourseSheet>> openCourseSheetsBox() async { final box=await Hive.openBox<CourseSheet>('course_sheets'); if(box.isEmpty) { for(final s in preloadedCourseSheets) { await box.put(s.id,s); } } return box; }
