void main() {
  // Instanciamos la clase de manejo de pacientes.
  final pacienteCRUD = PacienteCRUD();

  // Creamos pacientes con sus datos iniciales.
  final juanPerez = Paciente(
    id: 1,
    nombre: "Juan",
    primerApellido: "Perez",
    segundoApellido: "Lopez",
    genero: Genero.hombre,
    grupoSanguineo: GrupoSanguineo.APositivo,
    curp: "PELJ010101HDFRNN08",
    fechaNacimiento: DateTime(2001, 01, 01),
    estatusVida: EstatusVida.Vivo,
    estatusMedico: "estable",
    nss: "12345678901",
    tipoSeguro: TipoSeguro.IMSS,
    fechaUltimaCita: DateTime.now(),
    fechaRegistro: DateTime.now(),
  );

  final mariaGarcia = Paciente(
    id: 2,
    nombre: "Maria",
    primerApellido: "Garcia",
    segundoApellido: null,
    genero: Genero.mujer,
    grupoSanguineo: GrupoSanguineo.BNegativo,
    curp: "GAMM020202MDFRRA09",
    fechaNacimiento: DateTime(2002, 02, 02),
    estatusVida: EstatusVida.Vivo,
    estatusMedico: "ex-trabajadora",
    nss: "98765432101",
    tipoSeguro: TipoSeguro.ISSSTE,
    fechaUltimaCita: DateTime.now(),
    fechaRegistro: DateTime.now().subtract(Duration(days: 100)),
  );

  final pedroSanchez = Paciente(
    id: 3,
    nombre: "Pedro",
    primerApellido: "Sanchez",
    segundoApellido: "Fernandez",
    genero: Genero.hombre,
    grupoSanguineo: GrupoSanguineo.ONegativo,
    curp: "SAFP990303HDFRNR02",
    fechaNacimiento: DateTime(1999, 03, 03),
    estatusVida: EstatusVida.Fallecido,
    estatusMedico: "Fallecido por muerte natural",
    nss: "13579246801",
    tipoSeguro: TipoSeguro.SeguroPopular,
    fechaUltimaCita: DateTime.now().subtract(Duration(days: 90)),
    fechaRegistro: DateTime.now().subtract(Duration(days: 90)),
  );

  // Agregamos los pacientes a la lista.
  pacienteCRUD.create(juanPerez);
  pacienteCRUD.create(mariaGarcia);
  pacienteCRUD.create(pedroSanchez);

  // Mostramos la lista de pacientes registrados.
  pacienteCRUD.read();

  // Actualizamos a cada paciente de manera diferente.
  print("\n---------------------Actualizar Todos-----------------------");
  juanPerez.estatus = false; // Cambiamos el estatus de Juan a inactivo.
  pacienteCRUD.update(juanPerez); // Actualizamos a Juan.
  
  mariaGarcia.estatusMedico = "en tratamiento"; // Cambiamos el estatus médico de María.
  pacienteCRUD.update(mariaGarcia); // Actualizamos a María.

  pedroSanchez.estatusMedico = "en recuperación"; // Cambiamos el estatus médico de Pedro.
  pacienteCRUD.update(pedroSanchez); // Actualizamos a Pedro.

  pacienteCRUD.read(); // Mostramos la lista actualizada.

  // Eliminamos atributos diferentes de cada paciente.
  print("\n---------------------Eliminar Atributos-----------------------");
  pacienteCRUD.removeCurp(juanPerez.id); // Eliminamos CURP de Juan.
  pacienteCRUD.removeNSS(mariaGarcia.id); // Eliminamos NSS de María.
  pacienteCRUD.removeTipoSeguro(pedroSanchez.id); // Eliminamos Tipo de Seguro de Pedro.

  pacienteCRUD.read(); // Mostramos la lista después de la eliminación de atributos.
}

// Clase para manejar operaciones CRUD de pacientes.
class PacienteCRUD {
  final List<Paciente> pacientes = []; // Lista para almacenar pacientes.

  // Método para agregar un nuevo paciente.
  void create(Paciente paciente) {
    pacientes.add(paciente);
    print("Paciente ${paciente.nombre} (ID: ${paciente.id}) agregado."); // Mensaje de confirmación.
  }

  // Método para leer todos los pacientes.
  void read() {
    if (pacientes.isEmpty) {
      print("No hay pacientes registrados."); // Mensaje si no hay pacientes.
      return;
    }
    print("Pacientes registrados:");
    for (var paciente in pacientes) {
      print(paciente); // Mostramos la información de cada paciente.
    }
  }

  // Método para actualizar un paciente existente.
  void update(Paciente pacienteActualizado) {
    for (var i = 0; i < pacientes.length; i++) {
      if (pacientes[i].id == pacienteActualizado.id) {
        pacientes[i] = pacienteActualizado; // Actualizamos la información del paciente.
        print("Paciente ${pacienteActualizado.nombre} (ID: ${pacienteActualizado.id}) actualizado. ESTATUS: ${pacienteActualizado.estatus ? 'ACTIVO' : 'INACTIVO'}");
        return;
      }
    }
    print("Paciente no encontrado."); // Mensaje si el paciente no existe.
  }

  // Métodos para eliminar atributos específicos.
  void removeCurp(int id) {
    for (var paciente in pacientes) {
      if (paciente.id == id) {
        paciente.curp = null; // Eliminamos la CURP del paciente.
        print("CURP de paciente con ID $id eliminada.");
        return;
      }
    }
    print("Paciente con ID $id no encontrado."); // Mensaje si el paciente no existe.
  }

  void removeNSS(int id) {
    for (var paciente in pacientes) {
      if (paciente.id == id) {
        paciente.nss = "NSS eliminado"; // Eliminamos el NSS del paciente.
        print("NSS de paciente con ID $id eliminado.");
        return;
      }
    }
    print("Paciente con ID $id no encontrado."); // Mensaje si el paciente no existe.
  }

  void removeTipoSeguro(int id) {
    for (var paciente in pacientes) {
      if (paciente.id == id) {
        paciente.tipoSeguro = TipoSeguro.values[0]; // Restablecemos a un valor predeterminado.
        print("Tipo de seguro de paciente con ID $id eliminado.");
        return;
      }
    }
    print("Paciente con ID $id no encontrado."); // Mensaje si el paciente no existe.
  }

  // Método para eliminar un paciente por ID.
  void delete(int id) {
    final int initialLength = pacientes.length; // Guardamos la longitud inicial.
    pacientes.removeWhere((paciente) => paciente.id == id); // Eliminamos el paciente de la lista.
    final int finalLength = pacientes.length; // Guardamos la longitud final.

    if (initialLength > finalLength) {
      print("Paciente con ID $id eliminado."); // Mensaje de confirmación.
    } else {
      print("Paciente con ID $id no encontrado."); // Mensaje si el paciente no existe.
    }
  }
}

// Enumeraciones para el estado de vida de un paciente.
enum EstatusVida { Vivo, Fallecido }
// Enumeraciones para los tipos de seguro.
enum TipoSeguro { IMSS, ISSSTE, SeguroPopular }
// Enumeraciones para los grupos sanguíneos.
enum GrupoSanguineo { OPositivo, ONegativo, APositivo, ANegativo, BPositivo, BNegativo, ABPositivo, ABNegativo }
// Enumeraciones para el género.
enum Genero { hombre, mujer, otro }

// Clase abstracta que define una persona con información básica.
abstract class Persona {
  int id; // ID único de la persona.
  String nombre; // Nombre de la persona.
  String primerApellido; // Primer apellido.
  String? segundoApellido; // Segundo apellido (puede ser nulo).
  Genero genero; // Género de la persona (hombre, mujer, otro).
  GrupoSanguineo grupoSanguineo; // Grupo sanguíneo.
  String? curp; // CURP de la persona (puede ser nulo si no está registrado).
  DateTime fechaNacimiento; // Fecha de nacimiento.
  bool estatus; // Estatus de la persona (Activo o Inactivo).
  DateTime fechaRegistro; // Fecha de registro de la persona en el sistema.
  DateTime? fechaActualizacion; // Fecha de la última actualización de los datos.

  // Constructor para inicializar los atributos de una persona.
  Persona({
    required this.id,
    required this.nombre,
    required this.primerApellido,
    this.segundoApellido,
    required this.genero,
    required this.grupoSanguineo,
    this.curp,
    required this.fechaNacimiento,
    this.estatus = true,
    DateTime? fechaRegistro,
    this.fechaActualizacion,
  }) : fechaRegistro = fechaRegistro ?? DateTime.now(); // Inicializa fechaRegistro si no se proporciona.

  // Método que devuelve los datos de la persona en formato de texto.
  @override
  String toString() {
    String formatFechaNacimiento = "${fechaNacimiento.day.toString().padLeft(2, '0')}/" +
        "${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}";
    String status = estatus ? "Activo" : "Inactivo"; // Estatus de la persona.

    return """
      --------------------------------------------------------------
      DATOS DE LA PERSONA
      --------------------------------------------------------------
      ID: $id,
      Nombre: $nombre $primerApellido ${segundoApellido ?? ""} // Muestra el nombre completo
      Género: ${genero.name}
      Grupo Sanguíneo: ${grupoSanguineo.name}
      Fecha de nacimiento: $formatFechaNacimiento
      CURP: ${curp ?? 'No registrado'}
      Estatus: $status
      Fecha de registro: $fechaRegistro
      --------------------------------------------------------------
    """;
  }
}

// Clase Paciente que extiende de Persona, añadiendo atributos específicos para un paciente.
class Paciente extends Persona {
  EstatusVida estatusVida; // Estado de vida del paciente (Vivo o Fallecido).
  String estatusMedico; // Estatus médico actual del paciente.
  String nss; // Número de seguro social del paciente.
  TipoSeguro tipoSeguro; // Tipo de seguro médico.
  DateTime fechaUltimaCita; // Fecha de la última cita médica.
  DateTime fechaRegistroHospital; // Fecha de registro en el hospital.

  // Constructor que inicializa un objeto Paciente.
  Paciente({
    required int id,
    required String nombre,
    required String primerApellido,
    String? segundoApellido,
    required Genero genero,
    required GrupoSanguineo grupoSanguineo,
    String? curp,
    required DateTime fechaNacimiento,
    required this.estatusVida,
    required this.estatusMedico,
    required this.nss,
    required this.tipoSeguro,
    required this.fechaUltimaCita,
    required DateTime fechaRegistro,
  }) : fechaRegistroHospital = fechaRegistro, // Inicializa la fecha de registro del hospital.
       super(
            id: id,
            nombre: nombre,
            primerApellido: primerApellido,
            segundoApellido: segundoApellido,
            genero: genero,
            grupoSanguineo: grupoSanguineo,
            curp: curp,
            fechaNacimiento: fechaNacimiento,
            fechaRegistro: fechaRegistro);

  // Método que cambia el estatus de vida a "Fallecido" y registra la defunción.
  void registrarDefuncion({required String motivo}) {
    final fechaDefuncion = DateTime.now();
    estatusVida = EstatusVida.Fallecido; // Cambia el estado a Fallecido.
    estatusMedico = "Fallecido $motivo. Fecha: $fechaDefuncion"; // Incluye motivo y fecha en el estatus.
  }

  // Sobrescribe el método toString para incluir los datos específicos del paciente.
  @override
  String toString() {
    String output = super.toString();
    output += "Estatus vida: $estatusMedico\n" +  // Estatus vida con motivo y fecha
              "NSS: $nss\n" +
              "Tipo de seguro: ${tipoSeguro.name}\n" +
              "Fecha de última cita: ${fechaUltimaCita.day.toString().padLeft(2, '0')}/" +
              "${fechaUltimaCita.month.toString().padLeft(2, '0')}/${fechaUltimaCita.year}\n" +
              "Fecha de registro en el hospital: ${fechaRegistroHospital.day.toString().padLeft(2, '0')}/" +
              "${fechaRegistroHospital.month.toString().padLeft(2, '0')}/${fechaRegistroHospital.year}\n"; // Muestra la fecha de registro del hospital
    return output;
  }
}