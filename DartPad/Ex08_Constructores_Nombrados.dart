void main ()
{
//Constructores Nombrados
  //Caso de prueba 1
  final juanPerez = Person(

      ID:254,
      name:"Juan Manuel",
      firstLastName:"Perez",
      secondLastName:"Rodriguez",
      gender:"Hombre",
      bloodGroup: "O+",
      curp: "PERJ920805HPLRN07",
      birthdate: DateTime(1992,08,05),
      isActive: true,
      createdAt: DateTime(2024,09,2024,11,05,16),

  );

  print(juanPerez);

// Caso de prueba 2 ----> Enviando los datos requeridos obligatorios
    final marthaFlores = Person(

     ID:125,
     name:"Martha",
     firstLastName:"Flores",
     gender:"Mujer",
     bloodGroup: "O-",
     curp: "",
     birthdate: DateTime(2000,01,08),

 );
    print(marthaFlores);

}


class Person
  {
  int ID;
  String? cortesyTitle;
  String name;
  String firstLastName;
  String? secondLastName;
  String gender;
  String bloodGroup;
  String? curp;
  DateTime birthdate;
  bool isActive;
  DateTime createdAt;
  DateTime? updateAt;


  Person(
    {
    required this.ID,
    required this.name,
    this.cortesyTitle,
    required this.firstLastName,
    this.secondLastName,
    required this.gender,
    required this.bloodGroup,
    this.curp,
    required this.birthdate,
    this.isActive=true,
    DateTime? createdAt,
    this.updateAt
  }

  ):createdAt=createdAt??DateTime.now();


  @override
  String toString()
  {
    String formateDate = "${birthdate.day.toString().padLeft(2,'0')}/"+
      "${birthdate.month.toString().padLeft(2,'0')}/${birthdate.year}";
    String formateCreateDate =                
      "${createdAt.day.toString().padLeft(2,'0')}/"+
      "${createdAt.month.toString().padLeft(2,'0')}/${createdAt.year}     ${createdAt.hour.toString().padLeft(2,'0')} : ${createdAt.minute.toString().padLeft(2,'0')} : ${createdAt.second.toString().padLeft(2,'0')}";

    curp ??= "No registrado";
    if (curp == "") curp = "No registrado";
    String status = "Sin definir";
    if (isActive)
      status = "Activo";
    else
      status = "Inactivo";
    
    return """
      --------------------------------------------------------------
      DATOS DE LA PERSONA
      --------------------------------------------------------------
      ID: $ID,
      Nombre: $name $firstLastName $secondLastName
      Genero: $gender
      Grupo Sanguineo: $bloodGroup
      Fecha de nacimiento: $formateDate
      CURP: $curp
      Activo: $isActive
      Fecha de registro:  $formateCreateDate
      --------------------------------------------------------------
      """;
  }
  }