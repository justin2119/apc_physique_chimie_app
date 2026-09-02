import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() => runApp(const ApcApp());

class ApcApp extends StatelessWidget {
  const ApcApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'APC Physique & Chimie',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.styleCarre,
        home: const Scaffold(body: Center(child: Text('Bienvenue à Lycée de Vogan'))),
      );
}
