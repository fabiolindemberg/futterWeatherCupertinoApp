import 'city.dart';

class ResponsePage {
  String message;
  String cod;
  int count;
  List<City> list;

  ResponsePage(this.message, this.cod, this.count, this.list);

  ResponsePage.fromJson(Map<String, dynamic> json)
    : message = json["message"],
      cod = json["cod"],
      count = json["count"],
      list = json["list"].map<City>((city) => City.fromJson(city)).toList();
    
}