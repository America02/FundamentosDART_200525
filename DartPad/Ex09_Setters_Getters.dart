void main() {
  final mySquare = Square(side: 18); // Instancia de Square con un lado de 18.

  // Mostrar el lado y el área usando la propiedad pública y el método           correspondiente.
  print("""
  Lado del Cuadrado: ${mySquare.side}
  Área que ocupa: ${mySquare.calculateArea()}""");
  
  mySquare.side = -32; // Esto lanzará una excepción.
  
}
class Square {
  double _side; // Variable privada para almacenar el valor del lado del cuadrado.

  // Constructor que inicializa el lado del cuadrado. El parámetro 'side' es requerido.
  Square({required double side})
      : _side = side; // Inicializa la variable privada con el valor del parámetro.

  // Getter para acceder al área (lado * lado).
  double get area {
    return _side * _side; // Retorna el área del cuadrado (lado al cuadrado).
  }

  // Getter para acceder al valor del lado de manera segura.
  double get side {
    return _side; // Retorna el valor del lado.
  }

  // Setter para asignar un nuevo valor al lado, con validación.
  set side(double value) {
    print("Asignando un nuevo valor al lado: $value");

    // Validación: no se permite asignar valores negativos.
    if (value < 0) throw 'El valor del lado debe ser mayor a 0.';

    _side = value; // Asigna el nuevo valor si es válido.
  }

  // Método para calcular el área usando el valor del lado.
  double calculateArea() {
    return _side * _side; // Devuelve el área calculada.
  }
}