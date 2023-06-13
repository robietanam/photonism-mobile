import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

import '../../props/utils/location_service.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({Key? key, this.locationAwal}) : super(key: key);

  final LatLong? locationAwal;
  @override
  State<LocationPickerPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LocationPickerPage> {
  late LocationService locationService;
  LatLong location = LatLong(0, 0);
  bool _isLoading = true;
  @override
  void initState() {
    final locationAwal = widget.locationAwal;
    locationService = LocationService();

    if (locationAwal != null) {
      location = locationAwal;

      _isLoading = false;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        locationService.getPosition().then((value) {
          setState(() {
            _isLoading = false;
            location = LatLong(value.latitude, value.longitude);
          });
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Lokasi'),
      ),
      body: (!_isLoading)
          ? OpenStreetMapSearchAndPick(
              center: location,
              buttonColor: Theme.of(context).primaryColor,
              buttonText: 'Pilih lokasi',
              hintText: 'Masukkan lokasi',
              locationPinIconColor: Theme.of(context).primaryColor,
              onPicked: (pickedData) {
                Navigator.pop(context, pickedData);
                // print(pickedData.latLong.latitude);
                // print(pickedData.latLong.longitude);
                // print(pickedData.address);
              },
              onGetCurrentLocationPressed: locationService.getPosition,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
