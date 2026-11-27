enum Level {
  junior(40000),
  middle(80000),
  senior(150000);

  const Level(this.baseSalary);

  final int baseSalary;
}

abstract class Employee {
  final String name;
  final Level level;

  const Employee(this.name, this.level);

  int calculateSalary();
}

class Developer extends Employee {
  final int closedProjects;

  const Developer(super.name, super.level, this.closedProjects);

  @override
  int calculateSalary() => level.baseSalary + closedProjects * 10000;
}

class Manager extends Employee {
  final int teamSize;

  const Manager(super.name, super.level, this.teamSize);

  @override
  int calculateSalary() => level.baseSalary + teamSize * 5000;
}

void main() {
  final employees = <Employee>[
    const Developer('Аня', Level.junior, 2),
    const Developer('Борис', Level.senior, 4),
    const Manager('Вика', Level.middle, 5),
    const Manager('Глеб', Level.senior, 3),
  ];

  employees.sort(
    (first, second) =>
        second.calculateSalary().compareTo(first.calculateSalary()),
  );

  for (final employee in employees) {
    print(
      '${employee.name} (${employee.level.name}): '
      '${employee.calculateSalary()} сом',
    );
  }

  final totalSalary = employees.fold<int>(
    0,
    (total, employee) => total + employee.calculateSalary(),
  );
  final totalManagerTeamSize = employees.whereType<Manager>().fold<int>(
    0,
    (total, manager) => total + manager.teamSize,
  );

  print('Общий фонд зарплат: $totalSalary сом');
  print('Людей в командах менеджеров: $totalManagerTeamSize');
}
