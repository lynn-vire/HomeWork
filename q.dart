class Figure {
  final String name;

  Figure(this.name);

  double area() => 0;

  @override
  String toString() => '$name, площадь ${_formatArea(area())}';
}

class Circle extends Figure {
  final double radius;

  Circle(this.radius) : super('Круг');

  @override
  double area() => 3.14 * radius * radius;

  @override
  String toString() =>
      'Круг r=${_formatNumber(radius)}, площадь ${_formatArea(area())}';
}

class Rectangle extends Figure {
  final double width;
  final double height;

  Rectangle(this.width, this.height) : super('Прямоугольник');

  @override
  double area() => width * height;

  @override
  String toString() =>
      'Прямоугольник ${_formatNumber(width)}x${_formatNumber(height)}, '
      'площадь ${_formatArea(area())}';
}

String _formatArea(double value) =>
    ((value * 100).roundToDouble() / 100).toStringAsFixed(2);

String _formatNumber(double value) => value == value.roundToDouble()
    ? value.toInt().toString()
    : value.toString();

void main() {
  final figures = <Figure>[Circle(2), Rectangle(3, 4), Circle(1.5)];

  for (final figure in figures) {
    print(figure);
  }

  final totalArea = figures.fold<double>(
    0,
    (total, figure) => total + figure.area(),
  );
  print('Общая площадь: ${_formatArea(totalArea)}');
}
