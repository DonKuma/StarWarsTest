import 'dart:convert';

import 'cast_model.dart';
import 'crew_model.dart';

StartWars startWarsFromJson(String str) => StartWars.fromJson(json.decode(str));

String startWarsToJson(StartWars data) => json.encode(data.toJson());

class StartWars {
  int? id;
  List<Cast>? cast;
  List<Crew>? crew;

  StartWars({
    this.id,
    this.cast,
    this.crew,
  });

  factory StartWars.fromJson(Map<String, dynamic> json) => StartWars(
        id: json["id"],
        cast: json["cast"] == null
            ? []
            : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null
            ? []
            : List<Crew>.from(json["crew"]!.map((x) => Crew.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": cast == null
            ? []
            : List<dynamic>.from(cast!.map((x) => x.toJson())),
        "crew": crew == null
            ? []
            : List<dynamic>.from(crew!.map((x) => x.toJson())),
      };
}
