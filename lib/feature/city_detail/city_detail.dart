

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/city.dart';

class CityDetail extends StatelessWidget{

  City city;
  
  CityDetail(this.city);

  @override
  Widget build(BuildContext context) {
    String iconUrl = city.weather.first.icon;
    return CupertinoPageScaffold(
      backgroundColor: Colors.indigo,
      navigationBar: _buildNavigationBar(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 120, 8, 8),
        child: Center(
          child: Column(
          children: <Widget>[
            Text(city.name, style: TextStyle(fontSize: 30, color: Colors.white),),
            Text(city.weather.first.description, style: TextStyle(fontSize: 22, color: Colors.white70), ),
            Image.network("http://openweathermap.org/img/wn/$iconUrl.png", width: 60, height: 60,),
          ],
        )),
      )
      );
  }

     _buildNavigationBar() {
    return CupertinoNavigationBar(
            middle: Text("Weather Info",
            style: TextStyle(fontSize: 20),)
          );
  }

}