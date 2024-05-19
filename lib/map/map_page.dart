import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../env/env.dart';

import 'search_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(35.17176088096857, 136.88817886263607);
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onTap(LatLng position) async {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: InfoWindow(
            title: 'Selected Location',
            snippet: '${position.latitude}, ${position.longitude}',
          ),
        ),
      );
    });

    // Get place information (for example, using reverse geocoding)
    String placeInfo = await _getPlaceInfo(position);
    String placeImage = await _getPlaceImage(position);

    // Save to database
    _saveToDatabase(position, placeInfo);
    // await _saveToDatabase(position, placeInfo);

    // Show the place information in an alert dialog
    _showPlaceInfo(context, placeInfo, placeImage);
  }

  Future<String> _getPlaceInfo(LatLng position) async {
    // Implement the logic to get place information, e.g., reverse geocoding
    // Here is a dummy implementation
    return 'Place information for (${position.latitude}, ${position.longitude})';
  }

  void _saveToDatabase(LatLng position, String placeInfo) {
    print(position);
    print(placeInfo);
  }

  Future<String> _getPlaceImage(LatLng position) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${position.latitude},${position.longitude}&radius=50&key=${Env.key}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['results'].isNotEmpty) {
        final photoReference =
            data['results'][0]['photos'][0]['photo_reference'];
        return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=${Env.key}';
      }
    }
    return '';
  }

  // Future<void> _saveToDatabase(LatLng position, String placeInfo) async {
  //   // Replace the URL with your actual endpoint
  //   final url = Uri.parse('https://your-database-endpoint.com/save');
  //   final response = await http.post(
  //     url,
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode({
  //       'latitude': position.latitude,
  //       'longitude': position.longitude,
  //       'place_info': placeInfo,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     // Successfully saved
  //     print('Saved successfully');
  //   } else {
  //     // Handle error
  //     print('Failed to save: ${response.reasonPhrase}');
  //   }
  // }

  void _showPlaceInfo(
      BuildContext context, String placeInfo, String placeImage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Place Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(placeInfo),
              placeImage.isNotEmpty ? Image.network(placeImage) : Container(),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          compassEnabled: false,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: _markers,
          onTap: _onTap,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
// 検索画面へ遷移させる処理
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
          child: Icon(Icons.search),
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       children: <Widget>[
  //         GoogleMap(
  //           onMapCreated: _onMapCreated,
  //           initialCameraPosition: CameraPosition(
  //             target: _center,
  //             zoom: 11.0,
  //           ),
  //           markers: _markers,
  //           onTap: _onTap,
  //         ),
  //         Positioned(
  //           top: 10,
  //           left: 10,
  //           right: 10,
  //           child: TypeAheadField(
  //             textFieldConfiguration: TextFieldConfiguration(
  //               controller: _typeAheadController,
  //               decoration: InputDecoration(
  //                 hintText: 'Search Location',
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(8.0),
  //                   borderSide: BorderSide(color: Colors.grey),
  //                 ),
  //                 prefixIcon: Icon(Icons.search),
  //               ),
  //             ),
  //             suggestionsCallback: (pattern) async {
  //               // ここに検索ロジックを実装
  //               return [];
  //             },
  //             itemBuilder: (context, suggestion) {
  //               // ここに検索結果のUIを実装
  //               return ListTile(
  //                 leading: Icon(Icons.location_on),
  //                 title: Text(suggestion.toString()),
  //               );
  //             },
  //             onSuggestionSelected: (suggestion) {
  //               // 検索結果が選択されたときの処理を実装
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
