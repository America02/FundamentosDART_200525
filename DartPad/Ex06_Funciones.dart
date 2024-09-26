void main() {

  final double current

  // 1. Llamado de una funcion sin parametros
  greetEveryone();
  
  // 2.Llamdo de una funcion que retorna valores
  //a) sin almacenar el valor en una variable 
  print("Hoy es el día número: ${getDayNumber()} del mes.");
  
  //b) Almacenando el valor de la funcion en una nueva variable
  
  final int DiaMes;
  DiaMes= getDayNumber(); 
  print("En tres días será: ${DiaMes+3}");
 
  //3. Llamado de una funcion con parametro obligatorio
  //a) Llamdo correcto
  print(greetSomeone("Brayan G."));
  //B) Llamado incorrecto con parametros que no son string
  print(greetSomeone(4));
  print(greetSomeone(3.1233));
  print(greetSomeone(-76));
  print(greetSomeone(true));
  print("--------------------------------------------------------------------");
  //3.1 Ahora hacemos el mismo experimento pero con la funcion de parametrso tipados
  /*print(greetSomeoneTyped("Brayan G.")); 
  print(greetSomeoneTyped(4));
  print(greetSomeoneTyped(3.1233));
  print(greetSomeoneTyped(-76));
  print(greetSomeoneTyped(true));*/
  
  //3.2
  //print(greetSomeone()); esta no se puede ejecutar porque si no se define
  //loS PARametros de una funcion por default estan defininidos como obligatorios
  
  
  //4. LLamado de una funcion con parametros opcionales
  //4.1 enviando ambos parametros
  print(greetHourOfDay("Alejandra", 9));
  //4.2 solo enviando el obligatorio
  print(greetHourOfDay("Juan", null));

  //5. Funciones LAMDA - las funciones lamda, mejor conocidad como funciones
  //anonimas o funciones simplificadas, se ejecutan de manera simple y no frecuente en la ejecucion de un programa o sistema
  var calculaCosto = (double productQueantity, double productPrice, double percentageDiscount) => (productQuantity * productPrice)*((100-percentageDiscount)/100);
  
  double cantidadProducto = 5;
  double precioProducto = 125.50;
  double descuento=2.5;
  
  print(""" 
  Costo del producto: ${precioProducto}
  Cantidad: ${cantidadProducto}
  Descuento: ${descuento}
  --------------------------------------------------------
  costo del carrito de compras : ${calculaCosto(cantidadProducto, precioProducto, descuento)}
  """);

  
}

//FUNCIONES Y PARAMETROS

//Declaracion

void greetEveryone()
{
  print("Hola A TODOS y TODAS ");
}


//2. FUNCION SIN PARAMETROS, QUE RETORNA DATOS
getDayNumber(){
  DateTime now = DateTime.now();
  int day = now.day;
  return day;
}

//3. FUNCION QUE RECIBE UN PARAMETRO, EN DART SI NO SE ESPECIFICA COMO OPCIONAL SIEMPRE SERÁ OBLIGATORIO
String greetSomeone(personName){
  return("Hola, ${personName}");
}
// 3.1 Tipado el parametro de Entrada
String greetSomeoneTyped(String personName) {
  return("Hola, ${personName}");
}

// 4. FUNCION CON PARAMETROS OPCIONALES

// int? puede ser opcional - nullSafety
String greetHourOfDay(String personName, int? hora)
{
  hora ??= DateTime.now().hour; //si es nulo entonces
  print("Hora ${hora}");
  String saludo;
  
  if(hora>=6 && hora <12){
    saludo= "Bueno dias :D";
  }else if(hora>=12 && hora < 18)
  {
    saludo="buenas tardes :D";
  }else
  {
    saludo="Buenas noches :D";
  }
  return "${saludo}, ${personName}";
    
}