import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/page/parking_data.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

import '../utils/colors_code.dart';

class SerchPage extends StatefulWidget {
  const SerchPage({Key? key}) : super(key: key);

  @override
  State<SerchPage> createState() => _HomeState();
}

class _HomeState extends State<SerchPage> {
  @override
  initState() {
    _determinePosition();
    // TODO: implement initState
    super.initState();
    readData();
  }

  Completer<GoogleMapController> _controller = Completer();
  Marker? currentPostion;

  readData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('UserParking');

    snapshot.onValue.listen((event) {
      List<Map<String, dynamic>> data = [];
      // _markers.add(currentPostion!);
      for (final child in event.snapshot.children) {
        // Handle the post.
        print("child is now: ${child.value}");
        // Convert to map.
        var mapValue = child.value as Map<dynamic, dynamic>;
        // Get the name value.
        var uid = mapValue['uid'];
        var name = mapValue['parkingname'];
        var address = mapValue['address'];
        double lat = mapValue['lat'];
        double long = mapValue['long'];
        // Print the name.

        // print lat long
        print("kkore lat $lat and long $long");

        Marker marker = Marker(
          markerId: MarkerId(uid),
          position: LatLng(lat, long),
          infoWindow: InfoWindow(title: name + "my add"),
          onTap: () {
            print("mytest  ${uid}");
            // setState(() {
            //
            // });
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (
                        context,
                        ) =>
                        ParkingPersionData(uid, name, address)));
          },
        );
        list.add(marker);
      }

      setState(() {
        _markers.addAll(list);
      });
    }, onError: (error) {
      // Error.
    });

    /* if (snapshot.exists) {
      print("data is ${snapshot.value}");
      for(var value in snapshot.children)
      {
        print("value is ${value}");
      }
    } else {
      print('No data available.');
    }*/
  }

  bool isLoading = false;

  /*final List<Marker> list = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(23.450001, 91.199997),
        infoWindow: InfoWindow(title: "Cumilla")),
    Marker(
        markerId: MarkerId("2"),
        position: LatLng(22.3667, 91.8000),
        infoWindow: InfoWindow(title: "Chatgram")),
    Marker(
        markerId: MarkerId("3"),
        position: LatLng(23.777176, 90.399452),
        infoWindow: InfoWindow(title: "Dhaka")),
    Marker(
        markerId: MarkerId("5"),
        position: LatLng(23.62264, 90.499797),
        infoWindow: InfoWindow(title: "Narayanganj")),
    Marker(
        markerId: MarkerId("4"),
        position: LatLng(23.015913, 91.397583),
        infoWindow: InfoWindow(title: "Feni")),
  ];*/
  final List<Marker> list = [];

  GoogleMapController? mapController;

  CameraPosition? _kGooglePlex;

  Set<Marker> _markers = {
    Marker(
        markerId: MarkerId("2"),
        position: LatLng(22.3667, 91.8000),
        infoWindow: InfoWindow(title: "Chatgram")),
  };
  Position? positione;
  var latitude;
  var longatute;

  // Set<Marker> _markers = {};

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    positione = await Geolocator.getCurrentPosition();

    setState(() {
      latitude = positione!.latitude;
      longatute = positione!.longitude;
      currentPostion = Marker(
        markerId: MarkerId("ID"),
        position: LatLng(positione!.latitude, positione!.longitude),
        onTap: () {
          setState(() {});
          print("${LatLng(positione!.latitude, positione!.longitude)}");
        },
      );
      _kGooglePlex = CameraPosition(
          target: LatLng(positione!.latitude, positione!.longitude), zoom: 10);
      print(latitude);
      print(longatute);
    });
  }

  // need a method to read list of data from firebase database
  // and add it to the list

  // void _onMapTap(LatLng latLng) {
  //   setState(() {
  //     print("Clicked..........$latLng");
  //     _markers.add(
  //       Marker(
  //         markerId: MarkerId('new_marker_${_markers.length}'),
  //         position: latLng,
  //         onTap: () {
  //           print("Marker Clicked");
  //         },
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return _kGooglePlex == null
        ? Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )
        : Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchMapPlaceWidget(
              bgColor: Colors.black,

              hasClearButton: true,
              placeType: PlaceType.address,

              placeholder: "Enter Pogiton",
              apiKey: "AIzaSyBcujzZ9DxIF7tmcfeo84EoMpjIdlPq024",
              // The language of the autocompletion
              language: 'en',
              // The position used to give better recomendations. In this case we are using the user position
              location: currentPostion!.position,
              radius: 30000,
              onSelected: (Place place) async {
                final geolocation = await place.geolocation;

                // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
                //final GoogleMapController controller = await mapController.future;
                mapController!.animateCamera(CameraUpdate.newLatLng(geolocation?.coordinates));
                mapController!.animateCamera(CameraUpdate.newLatLngBounds(geolocation?.bounds, 0));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.80,
              child: GoogleMap(
myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex!,
                zoomControlsEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set<Marker>.of(_markers),
                onTap: (latLng) {
                  print("Clicked..........$latLng");
               // //   Navigator.push(
               //        context,
               //        MaterialPageRoute(
               //            builder: (
               //                context,
               //                ) =>
               //                ParkingRegistrationPage(
               //                    positione?.latitude, positione!.longitude)));

                  setState(() {
                    currentPostion = Marker(
                      markerId: MarkerId('new_marker_${list.length}'),
                      position: latLng,
                      onTap: () {
                        print("Marker Clicked");
                      },
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
     // floatingActionButton: FloatingActionButton.extended(
     //    onPressed: _goToTheLake,
     //    label: const Text('To the lake!'),
     //    icon: const Icon(Icons.directions_boat),
     //  ),
    );
  }

  Future<void> _goToTheLake() async {
    _determinePosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex!));
  }


}
