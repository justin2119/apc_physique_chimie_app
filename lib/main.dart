import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'features/course_sheets/course_sheet.dart';
import 'features/course_sheets/course_sheets_screen.dart';
import 'features/evaluation_subjects/evaluation_subjects_screen.dart';
void main() async { WidgetsFlutterBinding.ensureInitialized(); await Hive.initFlutter(); Hive.registerAdapter(CourseSheetAdapter()); runApp(const ApcApp()); }
class ApcApp extends StatelessWidget { const ApcApp({super.key}); @override Widget build(BuildContext context)=>MaterialApp(title:'APC Physique & Chimie',debugShowCheckedModeBanner:false,theme:AppTheme.styleCarre,home:const Home()); }
class Home extends StatelessWidget { const Home({super.key}); @override Widget build(BuildContext c)=>Scaffold(backgroundColor:const Color(0xff263238),appBar:AppBar(title:const Text('APC Physique & Chimie'),backgroundColor:const Color(0xff263238)),body:ListView(padding:const EdgeInsets.all(20),children:[_Nav(label:'Fiches de cours',icon:Icons.menu_book,screen:CourseSheetsListScreen()),_Nav(label:'Sujets d’évaluation',icon:Icons.assignment,screen:EvaluationSubjectsScreen())])); }
class _Nav extends StatelessWidget { final String label; final IconData icon; final Widget screen; const _Nav({required this.label,required this.icon,required this.screen}); @override Widget build(BuildContext c)=>Card(child:ListTile(leading:Icon(icon,color:const Color(0xff4CAF50)),title:Text(label),onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>screen)))); }
