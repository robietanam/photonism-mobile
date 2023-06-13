import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:latlong2/latlong.dart';

class LocationService {
  Future<LatLng> getPosition() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;

      if (status.isGranted) {
      } else if (status.isDenied) {
        Map<Permission, PermissionStatus> status = await [
          Permission.location,
        ].request();
      }
    } else {
      final status = await Permission.location.request();
      if (status.isGranted) {
        Permission.location.request();
      }
      print("KOCAK");
      // permission is disabled
    }
    if (await Permission.location.isPermanentlyDenied) {
      openAppSettings();
    }

    Position position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  Future<bool> getStatus() async {
    return Permission.location.serviceStatus.isDisabled;
  }
}
