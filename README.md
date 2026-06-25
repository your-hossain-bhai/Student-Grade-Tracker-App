# Student Grade Tracker App

A premium, modern Flutter application that allows students to track their subjects, grades, and academic performance. Designed with custom light/dark theme support, robust form validation, and reactive state management.

## Features

- **Three Dedicated Screens**:
  1. **Add Subject**: Enter subject name and marks with live validation.
  2. **Subject List**: View all added subjects with marks and grades in a list, with swipe-to-delete support.
  3. **Summary**: Real-time stats dashboard displaying total subjects, average marks, overall grade, and lists of passing vs. failing subjects.
- **State Management (Provider)**: Zero `setState` calls are used in the application. All UI updates, active tab indices, list additions/deletions, and theme toggles are reactively managed via Provider.
- **Custom Aesthetic Themes**: Fully-customized Light and Dark themes. All visual elements resolve colors dynamically using `Theme.of(context)` (no hardcoded colors in the widget tree).
- **Dismissible Deletion**: Swipe list tiles to delete subjects with a floating snackbar notification allowing you to "Undo" the deletion.

## Requirements Checklist Status

- [x] **Subject Class**: Implements private `_mark` field and a dynamic `grade` getter returning A ($\ge$ 80), B ($\ge$ 65), C ($\ge$ 50), or F.
- [x] **Map/Where Operators**: Utilizes `.map()` to calculate average scores and `.where()` to separate passing and failing subjects.
- [x] **Form Validation**: Validates that subject name is not empty and marks are a valid decimal/number between 0 and 100.
- [x] **Subject List**: Uses a `ListView.builder` combined with `Dismissible` to remove subjects with a swipe.
- [x] **Live Summary**: Stats page recalculates average mark, overall grade, and passing lists instantly on list modification.
- [x] **Theme Toggling**: Integrated in the custom App Bar. Supports switching between custom light and dark mode schemes.
- [x] **No State Hardcoding**: Colors retrieved dynamically from context.
- [x] **Zero setState**: App uses `ChangeNotifierProvider` to handle all state.
- [x] **Run Cleanly**: Passes `flutter analyze` with 0 issues.

---

## Technical Details

### Subject Class Structure
The `Subject` class uses a private `_mark` field and a computed getter for the grade:
```dart
class Subject {
  final String name;
  final double _mark;

  Subject({required this.name, required double mark}) : _mark = mark;

  double get mark => _mark;

  String get grade {
    if (_mark >= 80) return 'A';
    if (_mark >= 65) return 'B';
    if (_mark >= 50) return 'C';
    return 'F';
  }
}
```

### Data Transformations (Map / Where)
Inside `GradeTrackerProvider`, the average mark is computed using `.map()` and `.fold()`:
```dart
double get averageMark {
  if (_subjects.isEmpty) return 0.0;
  final totalMarks = _subjects.map((s) => s.mark).fold<double>(0.0, (prev, element) => prev + element);
  return totalMarks / _subjects.length;
}
```
Filtering passing and failing subjects is achieved using `.where()`:
```dart
List<Subject> get passingSubjects => _subjects.where((s) => s.mark >= 50).toList();
List<Subject> get failingSubjects => _subjects.where((s) => s.mark < 50).toList();
```

---

## How to Run

### Prerequisites
Make sure you have [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your system.

### Running the App
1. Clone the repository to your local system.
2. Open your terminal in the project directory:
   ```bash
   cd student_grade_tracker
   ```
3. Fetch package dependencies:
   ```bash
   flutter pub get
   ```
4. Build and run the app:
   ```bash
   flutter run
   ```
