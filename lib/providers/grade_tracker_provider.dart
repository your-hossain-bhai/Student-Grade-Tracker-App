import 'package:flutter/material.dart';
import '../models/subject.dart';

class GradeTrackerProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];
  int _currentTabIndex = 0;
  bool _isDarkMode = false;

  List<Subject> get subjects => List.unmodifiable(_subjects);

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0.0;
    final totalMarks = _subjects
        .map((s) => s.mark)
        .fold<double>(0.0, (prev, element) => prev + element);
    return totalMarks / _subjects.length;
  }

  String get overallGrade {
    if (_subjects.isEmpty) return '-';
    final avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  List<Subject> get passingSubjects {
    return _subjects.where((s) => s.mark >= 50).toList();
  }

  List<Subject> get failingSubjects {
    return _subjects.where((s) => s.mark < 50).toList();
  }

  int get currentTabIndex => _currentTabIndex;

  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
  }

  void removeSubject(int index) {
    if (index >= 0 && index < _subjects.length) {
      _subjects.removeAt(index);
      notifyListeners();
    }
  }

  void deleteSubject(Subject subject) {
    final index = _subjects.indexOf(subject);
    if (index != -1) {
      removeSubject(index);
    }
  }
}
