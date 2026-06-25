import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/grade_tracker_provider.dart';
import 'screens/main_scaffold.dart';
import 'theme/custom_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GradeTrackerProvider(),
      child: const StudentGradeTrackerApp(),
    ),
  );
}

class StudentGradeTrackerApp extends StatelessWidget {
  const StudentGradeTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GradeTrackerProvider>(context);

    return MaterialApp(
      title: 'Student Grade Tracker',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: provider.themeMode,
      home: const MainScaffold(),
    );
  }
}
