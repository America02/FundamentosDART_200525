void main() {
  final mySquare = Square(side: 18); // Usamos 'side' en lugar de '_side'

  print("""
Lado del Cuadrado: ${mySquare.side}
Área que ocupa: ${mySquare.calculateArea()}""");

  mySquare.side = -32; // Intento de asignar valor negativo (causará excepción)
}

class Square {
  double _side; // Variable privada para almacenar el lado del cuadrado
  Square({required double side}) : _side = side;

  double get area => _side * _side; // Getter para el área (lado * lado)

  // Getter para acceder al valor del lado
  double get side => _side;

  // Setter para modificar el valor del lado
  set side(double value) {
    print("Asignando un nuevo valor al lado: $value");
    if (value < 0) throw 'El valor del lado debe ser mayor a 0.';
    _side = value;
  }

  // Método para calcular el área
  double calculateArea() {
    return _side * _side;
  }
}