import 'package:location/location.dart';
import '';

class LocationHelper {
  double longitude = 0;
  double latitude = 0;

  Future<void> getCurrentLocation() async {
    // runs long running task in background
    // Future<Position> position = Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);

    // await says to wait for the task before you print here . if not use future, states that
    // it doesn't have any value now, but it will in the future , just like in McDonalds,
    // they give you receipt for your order, and you wait until you are called upon for your order.
    // but if you print Future<Position> it will just say Instance of Future<Position> which is just a receipt, that's why we need await
    LocationData ? locationData;
    Location location = Location();
    Duration d=Duration(seconds: 5);
    try {
      locationData = await location.getLocation();
      location.changeSettings(accuracy: LocationAccuracy.low);
      bool serviceEnabled= false;
      serviceEnabled= await location.serviceEnabled();
      var permissionEnabled= await location.hasPermission();

      if(!serviceEnabled){
        location.requestService();
      }
      if(permissionEnabled==PermissionStatus.denied){
        location.requestPermission();
      }
    } catch (e) {
      print(e);
    }
    if (locationData != null) {
      longitude = locationData.longitude!;
      latitude = locationData.latitude!;
    }
  }
}
