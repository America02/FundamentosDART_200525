void main() async {
  
  // Inicia el programa, mostrando este mensaje
  print('Inicio del programa');
  
  try {
    // Hacemos una "petición" y esperamos la respuesta con await
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // Si todo salió bien, mostramos la respuesta
    print('éxito: $value');
    
  } on Exception catch(err) {
    // Si encontramos una excepción específica, mostramos este mensaje
    print('Tenemos una Exception: $err');
    
  } catch (err) {
    // Si pasa algo inesperado, lo capturamos aquí
    print('OOP!! algo terrible pasó: $err');
    
  } finally {
    // Este bloque siempre se ejecuta, pase lo que pase
    print('Fin del try y catch');
  }
  
  // Final del programa
  print('Fin del programa');
}


// Simulamos una "petición" que tarda 1 segundo
Future<String> httpGet( String url ) async {
  
  await Future.delayed(const Duration(seconds: 1));
  
  // Lanzamos una excepción porque no hay parámetros en la URL
  throw Exception('No hay parámetros en el URL');
  

}
