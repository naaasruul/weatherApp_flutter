import 'package:geolocator/geolocator.dart';


class Location{

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async{
    bool serviceEnabled;
    LocationPermission permission;
    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, request them
      print("Location services are disabled.");
      return;
    }
    // Check if permission is granted
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        print("Location permissions are denied.");
        return;
      }
    }





    try{
      Position position = await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.low));
      latitude = position.latitude;
      longitude = position.longitude;

    }catch(e){
      print(e);
    }
  }

}

