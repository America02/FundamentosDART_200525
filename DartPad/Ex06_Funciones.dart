void main() {
  final double totalCarList;
  
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
  print(greetSomeone("America Y."));
  //B) Llamado incorrecto con parametros que no son string
  print(greetSomeone(4));
  print(greetSomeone(3.1233));
  print(greetSomeone(-76));
  print(greetSomeone(true));
  print("--------------------------------------------------------------------");
  //3.1 Ahora hacemos el mismo experimento pero con la funcion de parametrso tipados
  /*print(greetSomeoneTyped("America Y.")); 
  print(greetSomeoneTyped(4));
  print(greetSomeoneTyped(3.1233));
  print(greetSomeoneTyped(-76));
  print(greetSomeoneTyped(true));*/
  
  //3.2
  //print(greetSomeone()); //Esta  no se puede ejecutar porque si no se define los parametros de una          funcion por default estan definidos como obliogaotrios
  //4. Llamado de una funcion con parametros opcionales
  //4.1 Enviando ambos parametros
  print(greetHourOfDay("America",20));
  //4.2 Solo enviando elm obligatorio
  print(greetHourOfDay("Juan",null));
  
  //5 FUNCIONES LAMBDA mejor conocidad como0 funciones anonimas o simplificadas se ejecutan de manera simple y no frecuente
  var calculaCosto= (double productQueantity, double productPrice, double percentageDiscount)=> (productQueantity * productPrice)*((100-percentageDiscount)/100);
  
  double cantidadProducto=5;
  double precioProducto= 125.50;
  double descuento = 2.5;
  
  print("""
  costo del producto: ${precioProducto}
  cantidad: ${cantidadProducto}
  descuento: ${descuento}
  -----------------------------------------------------------
  Costo del carrito de compras: ${calculaCosto(cantidadProducto, precioProducto, descuento)}
  """);
  
  
}

//FUNCIONES Y PARAMETROS

//Declaracion

void greetEveryone()
{
  print("Hola A TODOS y TODAS 😘");
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

//int?   <-- pueder ser opcional -NullSafety
String greetHourOfDay(String personName, int? hora){
  hora ??= DateTime.now().hour;  //Si es nulo entonces 
  print("Hora: ${hora}");
  String saludo;
  if(hora>=6 && hora<12)
  {
   saludo="Buenos días";
  }
  else if (hora>12 && hora < 18)
  {
    saludo = "Buenas Tardes";
  }
  else
  {
    saludo="Buenas noches";
  }
  return "${saludo}, ${personName}";
}

