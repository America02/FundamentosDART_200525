void main() {
  
  // Llamamos a emitNumbers y escuchamos los valores que emite el Stream
  emitNumbers().listen( (value) {
     // Cada vez que llega un nuevo valor, lo mostramos en la consola
     print('Stream value: $value');
  });
  
} 


// Esta función regresa un Stream que emite un número cada segundo
Stream<int> emitNumbers() {
  
  // Usamos Stream.periodic para que emita un valor cada 1 segundo
  return Stream.periodic(const Duration(seconds: 1), (value) {
    // devolvemos el valor que va incrementando con cada emisión
    return value;
  }).take(5); // Limitamos a 5 emisiones y luego el Stream se cierra
  
}
