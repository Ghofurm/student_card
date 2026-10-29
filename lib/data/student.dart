class Student {
  const Student({
    required this.name,
    required this.npm,
    required this.program,
    required this.faculty,
    required this.university,
    required this.degree,
    required this.status,
    required this.intakeYear,
  });

  final String name;
  final String npm;
  final String program;
  final String faculty;
  final String university;
  final String degree;
  final String status;
  final int intakeYear;

  String get initials {
    final parts = name.split(' ').where((part) => part.isNotEmpty).toList();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}

const currentStudent = Student(
  name: 'Muchammad Abdul Ghofur',
  npm: '24670008',
  program: 'Teknik Informatika',
  faculty: 'Teknik dan Informatika',
  university: 'Universitas PGRI Semarang',
  degree: 'S1',
  status: 'Aktif',
  intakeYear: 2024,
);
