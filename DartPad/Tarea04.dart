void main() {
  // Caso 1: Nuevo paciente registrado hoy (datetime.now)
  final nuevoPaciente = Paciente(
    ID: 1,
    name: "Carlos",
    firstLastName: "Lopez",
    secondLastName: "Garcia",
    gender: "Hombre",
    bloodGroup: "A+",
    birthdate: DateTime(1995, 05, 10),  // Fecha de nacimiento
    NSS: "1234567890",
    tipoSeguro: "Seguro Social",
    estatusVida: "Vivo",
    estatusMedico: "Estable",
    fechaUltimaCita: DateTime.now(),              // Fecha de última cita actual
    fechaRegistroPaciente: DateTime.now(),        // Fecha de registro del paciente actual
    createdAt: DateTime.now()                     // Fecha de registro en el hospital actual
  );
  print(nuevoPaciente);

  // Caso 2: Paciente que alguna vez fue trabajador del hospital
  final exTrabajadorPaciente = Paciente(
    ID: 2,
    name: "Ana",
    firstLastName: "Martinez",
    gender: "Mujer",
    bloodGroup: "B+",
    birthdate: DateTime(1987, 11, 21),            // Fecha de nacimiento
    NSS: "9876543210",
    tipoSeguro: "Seguro Privado",
    estatusVida: "Vivo",
    estatusMedico: "En observación",
    fechaUltimaCita: DateTime(2023, 12, 12),      // Fecha anterior
    fechaRegistroPaciente: DateTime(2023, 06, 01),// Fecha de registro del paciente anterior
    createdAt: DateTime(2023, 06, 01),            // Fecha de registro en el hospital coincidente
    esExTrabajador: true,
  );
  print(exTrabajadorPaciente);

  // Caso 3: Paciente que acaba de fallecer
  final fallecidoPaciente = Paciente(
    ID: 3,
    name: "Luis",
    firstLastName: "Ramirez",
    gender: "Hombre",
    bloodGroup: "O-",
    birthdate: DateTime(1970, 03, 15),            // Fecha de nacimiento
    NSS: "5432167890",
    tipoSeguro: "Seguro Público",
    estatusVida: "Fallecido",
    estatusMedico: "N/A",
    fechaUltimaCita: DateTime(2022, 09, 30),      // Fecha anterior
    fechaRegistroPaciente: DateTime(2022, 01, 01),// Fecha de registro del paciente anterior
    createdAt: DateTime(2022, 01, 01),            // Fecha de registro en el hospital anterior
  );
  fallecidoPaciente.registraDefuncion();
  print(fallecidoPaciente);
}

abstract class Persona {
  int ID;
  String name;
  String firstLastName;
  String? secondLastName;
  String gender;
  String bloodGroup;
  DateTime birthdate;        // Fecha de nacimiento
  bool isActive;
  DateTime createdAt;        // Fecha de registro en el hospital
  DateTime? updateAt;

  Persona({
    required this.ID,
    required this.name,
    required this.firstLastName,
    this.secondLastName,
    required this.gender,
    required this.bloodGroup,
    required this.birthdate,
    this.isActive = true,
    required this.createdAt,
    this.updateAt,
  });

  @override
  String toString() {
    String formateDate = "${birthdate.day.toString().padLeft(2, '0')}/" +
        "${birthdate.month.toString().padLeft(2, '0')}/${birthdate.year}";
    String formateCreateDate = "${createdAt.day.toString().padLeft(2, '0')}/" +
        "${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year}     ${createdAt.hour.toString().padLeft(2, '0')} : ${createdAt.minute.toString().padLeft(2, '0')} : ${createdAt.second.toString().padLeft(2, '0')}";

    return """
    --------------------------------------------------------------
    ID: $ID
    Nombre: $name $firstLastName $secondLastName
    Genero: $gender
    Grupo Sanguineo: $bloodGroup
    Fecha de nacimiento: $formateDate
    Fecha de registro en el hospital:  $formateCreateDate
    --------------------------------------------------------------
    """;
  }
}

class Paciente extends Persona {
  String NSS;
  String tipoSeguro;
  String estatusVida;
  String estatusMedico;
  DateTime fechaUltimaCita;          // Fecha de última cita
  DateTime fechaRegistroPaciente;    // Fecha de registro del paciente
  bool esExTrabajador;

  Paciente({
    required int ID,
    required String name,
    required String firstLastName,
    String? secondLastName,
    required String gender,
    required String bloodGroup,
    required DateTime birthdate,
    required this.NSS,
    required this.tipoSeguro,
    required this.estatusVida,
    required this.estatusMedico,
    required this.fechaUltimaCita,
    required this.fechaRegistroPaciente, // Nueva fecha para el registro del paciente
    required DateTime createdAt,
    this.esExTrabajador = false,
  }) : super(
            ID: ID,
            name: name,
            firstLastName: firstLastName,
            secondLastName: secondLastName,
            gender: gender,
            bloodGroup: bloodGroup,
            birthdate: birthdate,
            createdAt: createdAt);

  void registraDefuncion() {
    estatusVida = "Fallecido";
    estatusMedico = "N/A";
    isActive = false;
    updateAt = DateTime.now();
  }

  @override
  String toString() {
    String baseInfo = super.toString();
    String formateUltimaCita = "${fechaUltimaCita.day.toString().padLeft(2, '0')}/" +
        "${fechaUltimaCita.month.toString().padLeft(2, '0')}/${fechaUltimaCita.year}";
    String formateFechaRegistro = "${fechaRegistroPaciente.day.toString().padLeft(2, '0')}/" +
        "${fechaRegistroPaciente.month.toString().padLeft(2, '0')}/${fechaRegistroPaciente.year}";

    return """
    $baseInfo
    NSS: $NSS
    Tipo de Seguro: $tipoSeguro
    Estatus de Vida: $estatusVida
    Estatus Médico: $estatusMedico
    Fecha de Última Cita: $formateUltimaCita
    Fecha de Registro del Paciente: $formateFechaRegistro
    Ex Trabajador: ${esExTrabajador ? 'Sí' : 'No'}
    --------------------------------------------------------------
    """;
  }
}