import 'dart:io';

double averageGrade(List<int> grades) {
  return grades.reduce((sum, grade) => sum + grade) / grades.length;
}

void main() {
  final students = <String, List<int>>{
    'Аня': [5, 4, 5],
    'Борис': [3, 4, 3],
    'Вика': [5, 5, 4],
    'Глеб': [2, 3, 3],
    'Даша': [4, 4, 4],
  };

  for (final entry in students.entries) {
    print('${entry.key}: ${averageGrade(entry.value).toStringAsFixed(2)}');
  }

  final bestStudent = students.entries.reduce(
    (best, student) =>
        averageGrade(student.value) > averageGrade(best.value) ? student : best,
  );
  print(
    'Лучший ученик: ${bestStudent.key} '
    '(${averageGrade(bestStudent.value).toStringAsFixed(2)})',
  );

  final studentsBelowThreshold = students.entries
      .where((student) => averageGrade(student.value) < 3.5)
      .toList();

  if (studentsBelowThreshold.isEmpty) {
    print('Все молодцы');
  } else {
    print('Средний балл ниже 3.5:');
    for (final student in studentsBelowThreshold) {
      print(
        '${student.key}: ${averageGrade(student.value).toStringAsFixed(2)}',
      );
    }
  }
}
