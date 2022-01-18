import 'package:flutter/material.dart';
import 'constants.dart';
class Weather_Card extends StatelessWidget {
  const Weather_Card({
    required this.time,
    required this.imgURL,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
    required this.date,
    required this.weatherCode,
  });

  final String time;
  final String date;
  final String imgURL;
  final num minTemp;
  final num maxTemp;
  final int humidity;
  final String weatherCode;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                time.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                date.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(height:50.0,child: Image.network(imgURL),width: 50.0,),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Min: $minTemp°',
                style: ktempTestStyle,
              ),
              SizedBox(
                height: 7,
              ),
              Text('Max: $maxTemp°', style: ktempTestStyle),
              SizedBox(
                height: 7,
              ),
              Text('Humidity: $humidity', style: ktempTestStyle),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover,
          image: AssetImage('images/$weatherCode'),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
