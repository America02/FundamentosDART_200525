void main() {
  
  // El programa inicia con este mensaje en consola
  print('Inicio del programa');
  
  // Simulamos una petición HTTP con un futuro que se resuelve luego de 1 segundo
  httpGet('https://fernando-herrera.com/cursos')
    .then( 
      // Si la petición es exitosa, mostramos la respuesta
      (value) {
        print(value);
      })
    .catchError( (err) {
      // Si ocurre un error en la petición, mostramos el error en consola
      print('Error: $err');
    });
  
  // Este mensaje se muestra inmediatamente, sin esperar la respuesta del futuro
  print('Fin del programa');
}


// Función que simula una petición HTTP y retorna un Future<String>
Future<String> httpGet( String url ){
  
  // Simulamos un retraso de 1 segundo para la respuesta de la "petición"
  return Future.delayed( const Duration(seconds: 1), () {
    
    // Simulamos un error en la petición, que activará el catchError
    throw 'Error en la petición http';
    
    // Si no hubiera error, retornaría esta cadena como respuesta
    // return 'Respuesta de la petición http';
    
  });
  
}
