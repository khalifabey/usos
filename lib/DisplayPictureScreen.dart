import 'dart:io';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:usos/thankyou.dart';
import 'camerascreen.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  String adresse = '';
  final currentDate = DateTime.now();
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // Location service is still not enabled.
        setState(() {
          adresse = 'GPS service is disabled.';
        });
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print("Location Data: $_locationData");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraScreen()),
                );
              },
              child: Icon(Icons.arrow_back_ios_sharp, color: Colors.white, size: 35),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                backgroundColor: Color(0xff1E1E1E),
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff1E1E1E),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            height: 300,
            width: 350,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFAACC00),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              height: 150,
              width: 175,
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFAACC00), // Color of the border
                    width: 2.0, // Width of the border
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(18.0)), // Adjust the border radius as needed
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)), // Match the border radius
                  child: Image.file(
                    File(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xff1E1E1E),
              border: Border.all(
                color: Color(0xFFAACC00),
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            height: 300,
            width: 350,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        // First word with red color
                        TextSpan(
                          text: "DATE:",
                          style: TextStyle(fontSize: 15,color: Color(0xffaacc00)),
                        ),
                        TextSpan(
                          text: "$currentDate \n",
                          style: TextStyle(color: Colors.white,
                        ),
                        ),
                        TextSpan(
                          text: "\nADRESSE:",
                          style: TextStyle(fontSize: 15, color: Color(0xffaacc00)),
                        ),
                        TextSpan(
                          text: _locationData != null
                              ? "Latitude: ${_locationData!.latitude}, Longitude: ${_locationData!.longitude} \n"
                              : "Location not available \n",
                          style: TextStyle(color: Colors.white),
                        ),
                        // You can add more TextSpan widgets for additional words.
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextFormField(
                    initialValue: 'Input text',
                    maxLength: 200,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.notes),
                      labelText: 'Votre commentaire',
                      labelStyle: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                      helperText: "Facultatif, \n si vous aviez plus d'informations sur la situation !",
                      suffixIcon: Icon(
                        Icons.check_circle,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Color(0xFFAACC00)),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThankYouPage()),
                  );
                },
                child: Text('Suivant'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.all(15),
                  backgroundColor: Color(0xFFAACC00),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
