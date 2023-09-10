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
    final size = MediaQuery.of(context).size;
    final isPortrait = size.height > size.width;

    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SingleChildScrollView(
        child: Column(
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
              height: isPortrait ? 300 : 150,
              width: isPortrait ? 350 : 175,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFAACC00),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                height: isPortrait ? 150 : 75,
                width: isPortrait ? 175 : 87.5,
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFAACC00),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(isPortrait ? 18.0 : 9.0)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(isPortrait ? 18.0 : 9.0)),
                    child: Image.file(
                      File(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: isPortrait ? 30 : 15),
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
              height: isPortrait ? 300 : 150,
              width: isPortrait ? 350 : 175,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "DATE:",
                            style: TextStyle(fontSize: 15,color: Color(0xffaacc00)),
                          ),
                          TextSpan(
                            text: "$currentDate \n",
                            style: TextStyle(color: Colors.white),
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
                          borderRadius: BorderRadius.circular(isPortrait ? 20.0 : 10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: isPortrait ? 30 : 15),
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
                      borderRadius: BorderRadius.circular(isPortrait ? 20.0 : 10.0),
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
      ),
    );
  }
}