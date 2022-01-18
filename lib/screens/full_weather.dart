import 'package:weatheureka/utilities/Full_Data.dart';
import 'package:weatheureka/screens/city_screen.dart';
import 'package:weatheureka/services/Full_Weather_Model.dart';
import 'package:weatheureka/services/weather.dart';
import 'package:weatheureka/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:weatheureka/utilities/Weather_card.dart';

class Full_Weather extends StatefulWidget {
  Full_Weather({required this.list, required this.cityName});

  List<FullData> list;
  String cityName;

  @override
  _Full_WeatherState createState() => _Full_WeatherState();
}

class _Full_WeatherState extends State<Full_Weather> {
  List<FullData> list=[];
  String cityName="";

  @override
  void initState() {
    super.initState();
    list = widget.list;
    cityName = widget.cityName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 50,
        actions: [
          FlatButton(
            minWidth: 50,
            onPressed: () async{
              var searchCity= await Navigator.push(context,MaterialPageRoute(builder: (context){
                return CityScreen(buttonText: 'Forecast');
              }));
              if(searchCity!=null){
                FullWeatherModel fml=FullWeatherModel();
                var newL= await fml.getCityWeatherData(searchCity,8);
                var newC= await fml.getCityName();
                setState(() {
                  list=newL;
                  cityName=newC;
                });
              }
            },
            child: Container(
              child: Icon(Icons.location_city_rounded,size: 30,),
            ),
          )
        ],
        title: Text("Forecast of $cityName",style: kHeadingTextStyle,),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            FullWeatherModel fl = FullWeatherModel();
            var newList = await fl.getFullWeatherData(8);
            var newCityName = await fl.getCityName();
            setState(() {
              list = newList;
              cityName = newCityName;
            });
          },
          child: ListView.builder(
            addAutomaticKeepAlives: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Weather_Card(
                time: list[index].time,
                imgURL: list[index].imgURL,
                minTemp: list[index].minTemp,
                maxTemp: list[index].maxTemp,
                humidity: list[index].humidity,
                date: list[index].date,
                weatherCode: list[index].weatherCode,
              );
            },
          ),
        ),
      ),
    );
  }
}
