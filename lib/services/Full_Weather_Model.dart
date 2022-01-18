import 'package:weatheureka/utilities/Full_Data.dart';
import 'package:weatheureka/services/location.dart';
import 'package:weatheureka/services/networking.dart';
import 'package:weatheureka/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatheureka/utilities/Full_Data.dart';

const url =
    'api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid=';
const imgUrl=
    "http://openweathermap.org/img/w/";

class FullWeatherModel{
  late num minTemp;
  late num maxTemp;
  late DateTime dateTime;
  late String icon,date,time,cityName;
  late int humidity,weatherCode;
  final d = DateFormat('dd-MM-yyyy');
  final t= DateFormat('hh:mm a');
  
  String? getBackImg(int code){

      if (code == 800)
        return 'clear.jpg';
      else {
        var code1 = code ~/ 100;
        switch (code1) {
          case 2:
            return 'thunderstorm.jpg';
          case 3:
            return 'drizzle.jpg';
          case 5:
            return 'rain.jpg';
          case 6:
            return'snow.jpg';
          case 7:
            switch(code){
              case 701:
                return 'mist.jpg';
              case 711:
                return 'smoke.jpg';
              case 721:
                return 'haze.jpg';
              case 731:
                return 'dust.jpg';
              case 751:
                return 'haze.jpg';
              case 741:
                return 'fog.jpg';
              case 761:
                return 'dust.jpg';
              case 762:
                return 'ash.jpg';
              case 771:
                return 'squall.jpg';
              case 781:
                return 'tornado.jpg';
            }
            break;
          case 8:
            return 'clouds.jpg';
        }
      }
  }
  Future<String> getCityName() async{
    if(cityName==null){
      return "heh";
    }
    else return cityName;
  }
  Future<List<Full_Data>> getCityWeatherData(String name,int max) async{
    List<Full_Data> list= [];
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
        "https://api.openweathermap.org/data/2.5/forecast?q=$name&appid=$weatherAPIKey&units=metric");
    var decodeData= await networkHelper.getDecodedData();
    var timezone= decodeData['city']['timezone'];
    cityName=decodeData['city']['name'];
    for(int i=0;i<=max;i++) {
      maxTemp = decodeData['list'][i]['main']['temp_max'];
      minTemp = decodeData['list'][i]['main']['temp_min'];
      humidity = decodeData['list'][i]['main']['humidity'];
      icon = imgUrl + decodeData['list'][i]['weather'][0]['icon'] + '.png';
      weatherCode = decodeData['list'][i]['weather'][0]['id'];
      DateTime dt = DateTime.fromMillisecondsSinceEpoch(
          (decodeData['list'][i]['dt'] + timezone) * 1000, isUtc: true);
      var now = DateTime.now();
      String now1 = d.format(now);
      date = d.format(dt);
      if (date == now1)
        date = 'Today';
      time = t.format(dt);
      list.add(new Full_Data(minTemp: minTemp,
          maxTemp: maxTemp,
          date: date,
          time: time,
          humidity: humidity,
          imgURL: icon,
          weatherCode: getBackImg(weatherCode).toString()));
    }
    return list;
  }

  Future<List<Full_Data>> getFullWeatherData(int max) async{
    List<Full_Data> list= [];
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/forecast?lat=${loc.latitude}&lon=${loc.longitude}&appid=$weatherAPIKey&units=metric');
    var decodeData= await networkHelper.getDecodedData();
    var timezone= decodeData['city']['timezone'];
    cityName=decodeData['city']['name'];
    for(int i=0;i<=max;i++) {
      maxTemp=decodeData['list'][i]['main']['temp_max'];
      minTemp=decodeData['list'][i]['main']['temp_min'];
      humidity=decodeData['list'][i]['main']['humidity'];
      icon=imgUrl+decodeData['list'][i]['weather'][0]['icon']+'.png';
      weatherCode=decodeData['list'][i]['weather'][0]['id'];
      DateTime dt = DateTime.fromMillisecondsSinceEpoch((decodeData['list'][i]['dt']+timezone)*1000,isUtc: true);
      var now=DateTime.now();
      String now1=d.format(now);
      date=d.format(dt);
      if(date==now1) date='Today';
      time=t.format(dt);
      list.add(new Full_Data(minTemp:minTemp, maxTemp:maxTemp,date: date,time: time,
          humidity: humidity,imgURL: icon,weatherCode: getBackImg(weatherCode).toString()));
    }

    return list;
  }
}
