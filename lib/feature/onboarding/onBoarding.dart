import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/feature/cities_list/city_list.dart';
import 'package:weather_app/service/city_service.dart';

import 'onBoardingItem.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description = "This project is a simple Flutter App, that list the forty cities closer you and give weather information about them!";
    return PageView(children: <Widget>[
      this.pageItem(OnBoardingItem("lib/images/sun_snow.jpg", "Weather APP", description, null)),
      this.pageItem(OnBoardingItem("lib/images/sun_rain.jpg", "Thank you to join us!", "Go ahead and check the weather around you!", Button("Get Started Now!!", () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (contex) => CityList(CityServiceImpl())));
      }))),

    ],);
  }

  Stack pageItem(OnBoardingItem item) {
    return Stack(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(item.image)
            )
          ),
        ),
        Container(color: Color(0x000000).withOpacity(0.6),),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(item.primaryText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
                  ),
                Text(item.secondaryText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                  ),
                ),
                item.button == null ? Container() : button(item.button),
              ],
            ),
          ),
        )
    ],
  );
  }

  Container button(Button button) {
    return Container(
                child: RaisedButton(
                  onPressed: button.onClick,
                  child: Text(button.label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14),),
                ),
              );
  }
}

