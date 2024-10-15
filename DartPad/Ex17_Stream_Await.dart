void main() {
  
  // Llamamos a emitNumber y nos ponemos a escuchar lo que nos va mandando
  emitNumber()
     .listen( (int value) {
       // Cada vez que recibimos un número, lo mostramos en consola
       print('Stream value: $value');
     });
}


Stream<int> emitNumber() async* {
  
  // Tenemos una lista de números que vamos a emitir uno por uno
  final valuesToEmit = [1, 2, 3, 4, 5];
  
  // Recorremos la lista y vamos soltando los números de a uno cada segundo
  for (int i in valuesToEmit) {
    await Future.delayed(const Duration(seconds: 1)); // Esperamos 1 segundo antes de emitir el siguiente
    yield i; // Emitimos el número
  }
}
