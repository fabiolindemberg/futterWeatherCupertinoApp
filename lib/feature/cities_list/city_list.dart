

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/feature/city_detail/city_detail.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/model/response_page.dart';
import 'package:weather_app/service/city_service.dart';

class CityList extends StatefulWidget {

  CityService service = CityServiceImpl();
    
  CityList([this.service]);

  @override
  _CityList createState() => _CityList();

}

class _CityList extends State<CityList> {
  
  List<City> dataSource = [];
  
  @override
  initState() {
    super.initState();
    _loadDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
          navigationBar: _buildNavigationBar(),
          child: dataSource.isEmpty ? _noDataFoundMessage() : ListView(
            children: dataSource.map((city) {
              return Container(child: listItem(city));
            }).toList(),
          ),
    );
  }

  _noDataFoundMessage() {
    return Container(
      child: Center(
        child: CupertinoActivityIndicator()
      ),
    );
  }

   _buildNavigationBar() {
    return CupertinoNavigationBar(
            middle: Text("Cities",
            style: TextStyle(fontSize: 20),)
          );
  }

  listItem(City city) {
    String iconUrl = city.weather.first.icon;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => CityDetail(city)));
      },
          child: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network("http://openweathermap.org/img/wn/$iconUrl.png"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(city.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(city.weather.first.description),
                  ],
                ),
              ],),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
   }

  _loadDataFromApi() {
        widget.service.fetchAllCities().then((response) {
      if (response.body != null) {
        var responsePage = ResponsePage.fromJson(jsonDecode(response.body));
        setState(() {
          dataSource = responsePage.list;
        });
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}