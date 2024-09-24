void main() {
 //list (list)
  //la declaracion de una list esta limitada por corchetes (brackets) , y cada
  //elemento de ser individual y puede repartirse
  
  final numeros=[1,2,2,2,3,3,3,4,5,6,7,7,7,8,9,10];
  
  print("Ejemplo de LIST: $numeros");
  print("Confirmamos el tipo de datos para numeros que es: ${numeros.runtimeType}");
  print("Podemos acceder a cierta información de una lista tal como : ");
  print("El tamaño: ${numeros.length}");
  print("""
  Para acceder a los elementos debemos especificar la posicion entre []
  El primer elementos en la primera posicion es: ${numeros[0]}
  El elemento en la segunda posicion es: ${numeros[1]}. siempre respetando la posicion -1
  El ultimo elemento de la lista seria: ${numeros[numeros.length-1]}
 --------------------------------------------------------------------------------------
 De igual manera existen las siguientes alternativas
 Primer elemento ${numeros.first}
 Ultimo elemento ${numeros.last}
 --------------------------------------------------------------------------------------
 Tambien tendremos algunos métodos que permiter la transformación del contenido
 Por ejemplo usar reversed, para invertir en el orden original: ${numeros.reversed}
 Es importante observar que la funcion reversed ha transformado a List original y la retorna
 como un ITERABLE
  """);

  //iterables
final numeroAlreves = numeros.reversed;
print("Los iterables son estructuras de datos que DART y otros lenguajes par optimizar en terminos de velocidadel acceso a los datos y propiedades");
print("Ejemplo de un ITERABLE: $numeroAlreves");
print("Confirmamos el tipo de datos para numeros que es:${numeroAlreves.runtimeType}");
print("De igual manera podemos transformar una LISTA en ITERABLE y vicevers");
print("Convertimos el ITERABLE a LISTA usando .toList(): ${numeroAlreves.toList()} y verificamos su tipo de dato ${numeroAlreves.toList().runtimeType}");

  //conjunto de datos
  //Un set es una estructura de datos utilizadas en DART, que simplifica los elementos eliminando los duplicados
print("""
Veamos que pasa con los Conjuntos SET
Convertimos el ITERABLE en un SET usando .toSet(): ${numeroAlreves.toSet()}
Podemos visualizar en el resultado que el SET a eliminado los duplicados y ahora delimita
los datos usando {}.
""");

//de igual manera podemos realizar operaciones para el filtro de elementos
final numerosMayoresA5= numeros.where((num){
return num>5;
});

print("""
Hemos filtrado sobre la LIST solo los elementos mayores a 5
Resultado filtro: ${numerosMayoresA5}
""");
print("Eliminamos duplicados ... ${numerosMayoresA5.toSet()}");
  
}