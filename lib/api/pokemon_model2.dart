class PokemonModel{

  String idcarta;
  String nombrecarta;
  String generacion;
  String tipocarta;
  String psa;
  String hp;

  PokemonModel(this.idcarta, this.nombrecarta, this.generacion, this.tipocarta, this.psa, this.hp);

  PokemonModel.fromJson(Map<String, dynamic>json){
    idcarta = json['id_carta'];
    nombrecarta = json['nombre_carta'];
    generacion = json['generación'];
    tipocarta = json['tipo_carta'];
    psa = json['PSA'];
    hp = json['Hp'];
  }

}