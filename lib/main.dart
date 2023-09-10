import 'package:flutter/material.dart';
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
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  runApp(FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(0, 30, 30, 30),
      ),
      debugShowCheckedModeBanner: false,
      home: FloatingScreen(),
    );
  }
}
