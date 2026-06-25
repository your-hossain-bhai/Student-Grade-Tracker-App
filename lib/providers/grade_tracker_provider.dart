import 'package:flutter/material.dart';
import '../models/subject.dart';

class GradeTrackerProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];
  int _currentTabIndex = 0;
  bool _isDarkMode = false;

  /// Returns an unmodifiable list of subjects to prevent direct modification
  List<Subject> get subjects => List.unmodifiable(_subjects);

  /// Gets the total number of subjects
  int get totalSubjects => _subjects.length;

  /// Calculates the average mark across all subjects using [.map()]
  double get averageMark {
    if (_subjects.isEmpty) return 0.0;
    final totalMarks = _subjects.map((s) => s.mark).fold<double>(0.0, (prev, element) => prev + element);
    return totalMarks / _subjects.length;
  }

  /// Calculates the overall grade based on the average mark
  String get overallGrade {
    if (_subjects.isEmpty) return '-';
    final avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  /// Filters and returns only the passing subjects using [.where()]
  List<Subject> get passingSubjects {
    return _subjects.where((s) => s.mark >= 50).toList();
  }

  /// Filters and returns only the failing subjects using [.where()]
  List<Subject> get failingSubjects {
    return _subjects.where((s) => s.mark < 50).toList();
  }

  /// Gets the current navigation tab index
  int get currentTabIndex => _currentTabIndex;

  /// Updates the navigation tab index and notifies listeners
  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  /// Gets the current theme mode
  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  /// Toggles between light and dark theme
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  /// Adds a new subject to the tracker
  void addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
  }

  /// Removes a subject at the specified index
  void removeSubject(int index) {
    if (index >= 0 && index < _subjects.length) {
      _subjects.removeAt(index);
      notifyListeners();
    }
  }

  /// Removes a specific subject from the list
  void deleteSubject(Subject subject) {
    final index = _subjects.indexOf(subject);
    if (index != -1) {
      removeSubject(index);
    }
  }
}
