void main() {
  final String pokemon ="Pikachu";
  final int hp=100;
  final bool isAlive=true;

  final abilities= ['Impact-Trueno','Cola de Hierro','Ataque rapido'];
  final sprites = <String> ['Pikachu_front.png','Pikachu_back.png'];
  
  
  print(""" El pokemon que elegistes es :$pokemon
  
  Las caracteristicas de $pokemon, son:
  Vida(HP): $hp
  Estatus de vida: $isAlive
  Habilidades:$abilities
  Imagenes: $sprites
  """
  );
  
}