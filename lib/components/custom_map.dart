import 'package:flutter/material.dart';
// import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMap extends StatefulWidget {
  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  // Location _location = Location();
  // late LatLng _currentLatLng;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Obtenir la position actuelle de l'utilisateur
  Future<void> _getCurrentLocation() async {
    bool _serviceEnabled;
    // PermissionStatus _permissionGranted;

    // // Vérifier si le service de localisation est activé
    // _serviceEnabled = await _location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await _location.requestService();
    //   if (!_serviceEnabled) {
    //     print('Le service de localisation est désactivé.');
    //     return;
    //   }
    // }

    // // Vérifier les permissions de localisation
    // _permissionGranted = await _location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await _location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     print('Permission de localisation non accordée.');
    //     return;
    //   }
    // }

    // Récupérer la position actuelle
    // LocationData _locationData = await _location.getLocation();
    // setState(() {
    //   _currentLatLng = LatLng(_locationData.latitude!, _locationData.longitude!);
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return
        //_isLoading?
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator()),
      //          FlutterMap(
      //   options: MapOptions(
      //     center: LatLng(51.5, -0.09), // Centre de la carte (coordonnées exemple)
      //     zoom: 13.0,
      //   ),
      //   children: [
      //     TileLayer(
      //       urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      //       subdomains: ['a', 'b', 'c'],
      //       // attributionBuilder: (_) {
      //       //   return Text("© OpenStreetMap contributors");
      //       // },
      //     ),
      //     MarkerLayer(
      //       markers: [
      //         Marker(
      //           width: 80.0,
      //           height: 80.0,
      //           point: LatLng(51.5, -0.09), // Position du marqueur (coordonnées exemple)
      //           builder: (ctx) => Container(
      //             child: Icon(
      //               Icons.location_on,
      //               color: Colors.red,
      //               size: 40.0,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
        

               ]);

    /*: FlutterMap(
            options: MapOptions(
              center: _currentLatLng,
              zoom: 14.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    point: _currentLatLng,
                    builder: (ctx) => Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          );*/
  }
}
