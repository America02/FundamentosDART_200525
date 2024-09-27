void main()
{
  //Repaso de Clases en DART

  //Instaciamos la clase Heroe
  print("Heroe 1 : ------------------------------------------------------------------");
  final wolverine = Hero("Logan", "Regeneracion");

  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);

  final scarletWitch = Hero("Magia del Caos", "Wanda");
  print("Heroe 2: -------------------------------------------------------------------");
  print(scarletWitch);
  print(scarletWitch.name);
  print(scarletWitch.power);

  final xmen = Team(type:"Heroes", name:"X-Men");
  print(xmen);
  print(xmen.name);
  print(xmen.type);
  print("----------------------------------------------------");

  final justiceLeague = Team(name:"La Liga de la Justicia");
  print(justiceLeague);
  print(justiceLeague.name);
  print(justiceLeague.type);

  //Intentamos instanciar la clase con solo el valor tipo, que no lo permite por que la propiedad de nombre es requerida
  //final hydra=Team(type: "Villanos");

}

//Clase con propiedades posicionales
class Hero
{
  String name;
  String power;

  Hero(String pName,String pPower):
    name = pName,
    power = pPower;

}

//Clase con propiedades no posicionales y nombradas
class Team
{
  String name;
  String type;
  //el constructor de la clase siempre debe llevar el mismo nombre de la misma
  Team({required this.name, this.type = "No definido."});

  @override
  String toString(){
    return 'Grupo: $name, Tipo: $type';
  }
}