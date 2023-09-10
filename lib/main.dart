import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:usos/camerascreen.dart';
import 'package:usos/kiribis.dart';
import 'DisplayPictureScreen.dart';
import 'floatscreen.dart'; // Import the FloatingScreen class
import 'package:camera/camera.dart';
import 'thankyou.dart';

import 'nextpage.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    // Request GPS location permission
    final status = await Permission.location.request();
    if (status.isGranted) {
      runApp(FigmaToCodeApp());
    } else {
      // Handle the case where permission is denied
      print('GPS location permission denied');
      // You can display an error message or exit the app gracefully.
    }
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
}

class FigmaToCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(0, 30, 30, 30),
      ),
      debugShowCheckedModeBanner: false,
      home: CameraScreen(),
    );
  }
}
