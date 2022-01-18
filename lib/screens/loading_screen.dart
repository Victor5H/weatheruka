import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as P;
import 'package:weatheureka/services/Full_Weather_Model.dart';
import 'package:weatheureka/services/weather.dart';
import 'full_weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    //getLocationData();
    getAll();
  }

  void getAll() async{
    FullWeatherModel fullWeatherModel = FullWeatherModel();
    var list= await fullWeatherModel.getFullWeatherData(8);
    var cityName=await fullWeatherModel.getCityName();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return Full_Weather(list: list,cityName: cityName,);
    }),(route)=>false);
  }

  // void getLocationData() async {
  //   Duration(seconds: 30);
  //
  //   var weatherData = await WeatherModel().getLocationWeather();
  //
  //   Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
  //     return LocationScreen(
  //       locationWeather: weatherData,
  //     );
  //   }),(route)=>false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
