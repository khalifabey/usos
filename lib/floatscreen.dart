import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'camerabutton.dart'; // Import your CameraButton class
import 'package:camera/camera.dart'; // Import the camera package
import 'package:flutter_svg/flutter_svg.dart';

class FloatingScreen extends StatefulWidget {
  @override
  _FloatingScreenState createState() => _FloatingScreenState();
}

class _FloatingScreenState extends State<FloatingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CameraButton()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAACC00),
      body: Center(
        child: Container(
          width: 150,
          height: 60,
           child: Image.asset('lib/assets/yousos.png'),
         )
      )
   );
  }
}
