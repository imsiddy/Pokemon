class Pokehub {
  int id;
  String name;
  List<Names> names;
  List<PokemonSpecies> pokemonSpecies;
  
    Pokehub({this.id, this.name, this.names, this.pokemonSpecies});
  
    Pokehub.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      name = json['name'];
      if (json['names'] != null) {
        names = new List<Names>();
        json['names'].forEach((v) {
          names.add(new Names.fromJson(v));
        });
      }
      if (json['pokemon_species'] != null) {
        pokemonSpecies = new List<PokemonSpecies>();
        json['pokemon_species'].forEach((v) {
          pokemonSpecies.add(new PokemonSpecies.fromJson(v));
        });
      }
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      if (this.names != null) {
        data['names'] = this.names.map((v) => v.toJson()).toList();
      }
      if (this.pokemonSpecies != null) {
        data['pokemon_species'] =
            this.pokemonSpecies.map((v) => v.toJson()).toList();
      }
      return data;
    }
  }
  
  class PokemonSpecies {
  String name;
  String url;

  PokemonSpecies({this.name, this.url});

  PokemonSpecies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

}

class Names {
  String name;
  Language language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }
}

class Language {
  String name;
  String url;

  Language({this.name, this.url});

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}