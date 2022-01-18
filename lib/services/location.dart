import 'package:geolocator/geolocator.dart';

class Location {
  double longitude = 0;
  double latitude = 0;

  Future<void> getCurrentLocation() async {
    // runs long running task in background
    // Future<Position> position = Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);

    // await says to wait for the task before you print here . if not use future, states that
    // it doesn't have any value now, but it will in the future , just like in McDonalds,
    // they give you receipt for your order, and you wait until you are called upon for your order.
    // but if you print Future<Position> it will just say Instance of Future<Position> which is just a receipt, that's why we need await
    Position ? position;
    Duration d=Duration(seconds: 5);
    try {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest,timeLimit: d);
    } catch (e) {
      print(e);
    }
    if (position != null) {
      longitude = position.longitude;
      latitude = position.latitude;
    }
  }
}
