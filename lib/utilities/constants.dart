import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);
const kFullWeatherTextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const weatherAPIKey = '822fc8446f5adc72ac8c766a871329a8';
const openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    size: 30,
    color: Colors.white,
  ),
  hintText: "Enter City Name",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  hintStyle: TextStyle(color: Colors.grey),
);

//////////////////
const backgroundColor= Color(0xff0B0C1E);
const ktempTestStyle=TextStyle(fontFamily: 'dongle',fontSize: 20);
var kHeadingTextStyle = GoogleFonts.monda(textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold));