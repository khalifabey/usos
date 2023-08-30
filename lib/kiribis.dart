import 'package:flutter/material.dart';
import 'package:usos/floatscreen.dart';
import 'camerabutton.dart'; // Import your CameraButton class
import 'package:camera/camera.dart'; // Import the camera package
import 'package:lottie/lottie.dart';

class kribis extends StatefulWidget {
  @override
  _kribisState createState() => _kribisState();
}

class _kribisState extends State<kribis> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FloatingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Lottie.asset(
        'lib/assets/KribisLAB.mp4.lottie.json',
        width: 1080,
        height: 1920,
        fit: BoxFit.fill,
      )
    );
  }
}
