void main() {
  final mySquare = Square(side: 10); // Usamos 'side' en lugar de '_side'
  print("""
  Lado del Cuadrado: ${mySquare._side}
  Área que ocupa: ${mySquare.calculateArea()}""");

   mySquare.side=-5; // Usamos 'side' en lugar de '_side'
  print("""
  Lado del Cuadrado: ${mySquare._side}
  Área que ocupa: ${mySquare.calculateArea()}""");
  
  
  final mySquare2 = Square(side: 10); // Usamos 'side' en lugar de '_side'
  print("""
  Lado del Cuadrado: ${mySquare2._side}
  Área que ocupa: ${mySquare2.calculateArea()}""");

}

class Square {
  double _side;

  Square({required double side})
      : assert(side >= 0, 'El valor del lado debe ser mayor a 0'),
        _side = side;

  double get area {
    return _side * _side;
  }

  set side(double value) {
    print('setting new value $value');
    if (value < 0) throw 'Value must be >= 0';
    _side = value;
  }


  // Método para calcular el área
  double calculateArea() {
    return _side * _side;
  }
}