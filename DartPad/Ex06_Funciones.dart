void main() {

  final double totalCalList;
  //1. Llamado de una funcion sin parametros
  greetEveryone();

  //2. LLAMADO DE UNA FUNCION QUE RETORNA VALORES
  //A)  SIN ALMACENAR EL VALOR DE UNA VARIABLE
  print("hoy es el dia numero: ${getDayNumber()} del mes.");
  //B) ALAMACENADO EL VALOR DE LA FUNCION EN UNA NUEVA VARIABLE
  final int diaMes;
  diaMes = getDayNumber();
  print("Entre tres dias sera: ${diaMes+3}");

//3. LLAMADO DE UNA FUNCION CON SOLO PARAMETRO OBLIGATORIO

//A) LLAMADO CORRECTO
print(greetSomeone("America"));
//B) DECALARDO COMO DYNAMIC
print(greetSomeone(4));
print(greetSomeone(-312));
print(greetSomeone(3.1415));
print(greetSomeone(true));
print("-----------------------------------------------------------------");

//C) MISMO EXPERIMENTO PERO AHORA CON LA FUNCION  PARAMETROS TIPADOS
/*print(greetSomeoneTyped("Bruno"));
print(greetSomeoneTyped(4));
print(greetSomeoneTyped(-312));
print(greetSomeoneTyped(3.1415));
print(greetSomeoneTyped(true));
*/
/*3.2
 print(greetSomeone()); Esta no se puede ejecutar porque si no se define 
 los parametros de una funcion por defaul estan definidos como obligatorios
 */
  //4. Llamado de una funcion con parametros opcionales
  //4.1 ENCVIANDO AMBOS PARAMETROS
  print(greetHourOfDay("America",9));
  //4.2 SOLO ENVIADO EL OBLIGATORIO
  print(greetHourOfDay("Julio", null));
  print(greetHourOfDay("Sam"));

  //5. FUNCIONES LAMBA - LAS FUNCIONES LAMBA, MEJOR CONOCIDAS COMO FUNCIONES ANONIMAS O FUNCIONES SIMPLEFICADAS, SE EJECUTAN DE MANERA SIMPLE Y NO FRECUENTE EN LA EJECUCUION DE UN PROGRAMA O UN SISTEMA

  var calculaCosto=(double productQuanbtity, double doubleProductPrice, double percentageDisscount)=>(productQuanbtity * doubleProductPrice)*((100-percentageDisscount)/100);
  double cantidadProducto = 5;
  double precioProducto = 125.50;
  double descuento = 2.5;
  print("""
  Costo del producto: ${precioProducto}
  Cantidad: ${cantidadProducto}
  Descuento: ${descuento}
  ----------------------------------------------------------------
  Costo del carrito de compras: ${calculaCosto(cantidadProducto, precioProducto, descuento)}
  """);
//6. llamado de la funcion con parametros nombrados
  print(infoCarListStatus(buyerName: "Chucho"));

  //6.1 llamado de una funcion con los parametros en desorden posicional
  print(infoCarListStatus(
    status: "En espera de pago",
    amountCarList: 2416.20,
    buyerName: "Samuel"
  ));
}

//FUNCIONES Y PARAMETROS 

  //DECLARACION

  //1. FUNCION SIN PARAMETROS
void greetEveryone()

{
  print("Hola a todas y todos :D");
}
//2. Funcion sin parametro, que retorna datos 
getDayNumber()
{
  DateTime now = DateTime.now();
  int day = now.day;
  return day;
}

//3. FUNCION QUE RECIBE UN PARAMETRO, EN DART SI NO SE ESPECIFICA COMO OPCIONAL SIEMPRE SERA OBLIGATORIO
String greetSomeone(personName)
{
  return("Hola, ${personName}");
}

String greetSomeoneTyped(String personName)
{
  return("Hola, ${personName}");
}

// 4. FUNCIÓN CON PARÁMETROS OPCIONALES
String greetHourOfDay(String personName, [int? hourDay]) //Puede ser opcional
{
  hourDay ??= DateTime.now().hour; // si es nulo entonces ..
  print("Hora: ${hourDay}");
  String saludo;

  if (hourDay >= 6 && hourDay < 12) {
    saludo = "Buenos Días";
  } else if (hourDay >= 12 && hourDay < 18) {
    saludo = "Buenas Tardes";
  } else {
    saludo = "Buenas Noches";
  }

  return "$saludo, $personName";

  
}
String infoCarListStatus({
  required String buyerName,
  double amountCarList = 0.0,
  String status = "Selección de productos",
}) {
  return "El carrito de compras de: $buyerName, tiene un total de: "
      "\$${amountCarList} y actualmente está en estatus: $status";
}
