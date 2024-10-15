void main() async {
  
  // Se imprime un mensaje indicando el inicio del programa
  print('Inicio del programa');
  
  try {
    // Esperamos el resultado de una función que simula una petición HTTP
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // Si la petición tiene éxito, imprimimos el valor recibido
    print(value);
    
  } catch (err) {
    // Si ocurre un error en la petición, lo capturamos y mostramos un mensaje
    print('Tenemos un error: $err');
  }
  
  // Este mensaje se imprime después de que se resuelve o falla la petición
  print('Fin del programa');
}


// Función que simula una petición HTTP y espera 1 segundo para dar la respuesta
Future<String> httpGet( String url ) async {
  
  // Simulamos un retraso de 1 segundo para representar el tiempo de espera de la petición
  await Future.delayed(const Duration(seconds: 1));
  
  // Generamos un error para que se maneje en el bloque try-catch
  throw 'Error en la petición';
  
  // Si no hubiera error, devolvería este mensaje como respuesta
  // return 'Tenemos un valor de la petición';
}
