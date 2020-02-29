
import 'package:weather_app/model/weather.dart';

import 'main.dart';

class City {
  int id;
  String name;
  Main main;
  List<Weather> weather;

  City(this.id, this.name, this.main, this.weather);

  City.fromJson(Map<String, dynamic> json) 
    : id = json["id"],
      name = json["name"],
      //main = Main.fromJson(json["main"]),
      weather = json["weather"].map<Weather>((weather) => Weather.fromJson(weather)).toList();
}