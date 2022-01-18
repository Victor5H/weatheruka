import 'package:flutter/cupertino.dart';

class Full_Data{

  num  _minTemp=0;
  num  _maxTemp=0;
  String _date="";
  String _time="";
  int _humidity=0;
  String _imgURL="";
  String _weatherCode="";

  Full_Data({required num minTemp,required  num maxTemp,required  String date,required  String time,required int humidity,required String imgURL,required String weatherCode}){
    this._minTemp=minTemp;
    this._maxTemp=maxTemp;
    this._weatherCode=weatherCode;
    this._date=date;
    this._date=date;
    this._time=time;
    this._imgURL=imgURL;
    this._humidity=humidity;
  }

  String get weatherCode => _weatherCode;

  String get date => _date;

  num get maxTemp => _maxTemp;

  num get minTemp => _minTemp;

  String get imgURL => _imgURL;

  int get humidity => _humidity;

  String get time => _time;
}