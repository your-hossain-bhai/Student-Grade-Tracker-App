class Subject {
  final String name;
  final double _mark;

  Subject({
    required this.name,
    required double mark,
  }) : _mark = mark;

  /// Exposes the private _mark field for reading
  double get mark => _mark;

  /// Calculates the letter grade based on the mark:
  /// - A (>= 80)
  /// - B (>= 65)
  /// - C (>= 50)
  /// - F (otherwise)
  String get grade {
    if (_mark >= 80) {
      return 'A';
    } else if (_mark >= 65) {
      return 'B';
    } else if (_mark >= 50) {
      return 'C';
    } else {
      return 'F';
    }
  }
}
