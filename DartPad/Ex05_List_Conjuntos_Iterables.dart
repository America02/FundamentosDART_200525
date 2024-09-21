void main() {
  //LISTAS (LIST)
  
  //la declaracion de una LIST esta limitada por Corchetes (BRACKETS), y cada elemento de ser individual y puede  repartirse
  
  final numeros =[1,2,2,3,4,5,5,6,7,7,7,8,9,9,9,10];
  
  print("Ejemplo de LIST: $numeros");
  print("Confirmamos el tipo de datos para NUMEROS que es: ${numeros.runtimeType}");
  print("Podemos acceder a cierta informacion de una lista tal como:");
  print("El tamaño: ${numeros.length}"); 
  print("""Para acceder a los elementos debemos especificar la posición entre []
  El primer elemento en la primera posicion es : ${numeros[0]}
  El elemento en la segunda posicion es ${numeros[1]}, siempre respetando el posicion -1
  El ultimo elemento de la lista seria ${numeros[numeros.length-1]}
  ------------------------------------------------------------------------------------------------
  De igual manera existen las siguientes alternativas
  Primer elemento ${numeros.first}
  Ultimo elemento ${numeros.last}
  ---------------------------------------------------------------------------------------------
  También tendremos acceso a algunos metedos que permiten la transformacion o filtrado del contenido
  Por ejemplo usar reversed, para invertir el orden original ${numeros.reversed}
  Es importante observar que la funcion reversed ha transformado a LIST original y la retorna como un ITERABLE
  """);



  // Iteracion (ITERABLES)

  final numeroAlreves=  numeros.reversed;
  print("Los iterables son estructuras de datos que DART y otros lenguajes para optimizar en terminos de velocidad ek acceso a los datos y propiedades");
  print("Ejemplo de un ITERABLE: $numeroAlreves");
  print("Confirmamos el tipo de datos para NUMEROSALREVES que es: ${numeroAlreves.runtimeType}");
  print("De igual manerda ñkde ks transformar una LISTA en ITERABLE y viceversa");
  print("Convertimos el ITERABLE a LISTA usando .toList(): ${numeroAlreves.toList()} y verificamos su tipo de dato ${numeroAlreves.toList().runtimeType}");
  
  
  //Conjunto de datos (SET)
  // Un SET es una estructura de datos utilizada por DART, que simplifica
  print("""Veamos que pasa con los conjuntos (SET)
  Convertimos el ITERABLE en un SET usando .toSET: ${numeroAlreves.toSet()}
  Podemois visualizar en el resultado que el SET a eliminado los duplicados y ahora delimita los datos usando {}
  """);
  
  //de igual manera podemos realizar operaciones para el filtro de elementos usando .where
  final numerosMayoresA5= numeros.where((int num){
    return num>5;
    });

  print("""Hemos filtrado sobre la LIST solos los elementos mayores a 5: Resultado de FILTRO ${numerosMayoresA5}""");
  print("Eliminamos duplicados .... ${numerosMayoresA5.toSet()}");

  
}