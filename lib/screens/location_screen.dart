//
// import 'package:flutter/material.dart';
// import 'package:weatheureka/services/weather.dart';
// import 'package:weatheureka/utilities/constants.dart';
//
// import 'city_screen.dart';
// import 'full_weather.dart';
//
// class LocationScreen extends StatefulWidget {
//   LocationScreen({this.locationWeather});
//
//   final locationWeather;
//
//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<LocationScreen> {
//   WeatherModel weatherModel = WeatherModel();
//   String city, weatherIcon, message;
//   int temperature;
//
//   @override
//   void initState() {
//     super.initState();
//     updateUI(widget.locationWeather);
//   }
//
//   void updateUI(dynamic weatherData) {
//     setState(() {
//       if (weatherData == null) {
//         temperature = 0;
//         weatherIcon = "Error";
//         message = "Unable to get weather data";
//         city = "";
//         return;
//       }
//       double temp = weatherData['main']['temp'];
//       temperature = temp.toInt();
//       message = weatherModel.getMessage(temperature);
//
//       city = weatherData['name'];
//
//       var condition = weatherData['weather'][0]['id'];
//       weatherIcon = weatherModel.getWeatherIcon(condition);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('images/location_background.jpg'),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//                 Colors.white.withOpacity(0.8), BlendMode.dstATop),
//           ),
//         ),
//         constraints: BoxConstraints.expand(),
//         child: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   FlatButton(
//                     onPressed: () async {
//                       var weatherData = await weatherModel.getLocationWeather();
//                       updateUI(weatherData);
//                     },
//                     child: Icon(
//                       Icons.near_me,
//                       size: 50.0,
//                     ),
//                   ),
//                   FlatButton(
//                     onPressed: () {
//                       Navigator.push(context,MaterialPageRoute(builder:(context){
//                         return Full_Weather();
//                       }));
//                     },
//                     child: Text(
//                       "Full weather",
//                       style: kFullWeatherTextStyle,
//                     ),
//                   ),
//                   FlatButton(
//                     onPressed: () async {
//                       var typedName = await Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return CityScreen(buttonText: '',);
//                       }));
//                       if (typedName != null)
//                         updateUI(await weatherModel.getCityWeather(typedName));
//                     },
//                     child: Icon(
//                       Icons.location_city,
//                       size: 50.0,
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 15.0),
//                 child: Row(
//                   children: <Widget>[
//                     Text(
//                       '$temperature°',
//                       style: kTempTextStyle,
//                     ),
//                     Text(
//                       '$weatherIcon',
//                       style: kConditionTextStyle,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: 15.0),
//                 child: Text(
//                   "$message in $city!",
//                   textAlign: TextAlign.right,
//                   style: kMessageTextStyle,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
