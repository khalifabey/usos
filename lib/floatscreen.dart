import 'package:flutter/material.dart';
import 'camerabutton.dart'; // Import your CameraButton class


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
          width: 140,
          height: 50,
           child: Image.asset('lib/assets/yousos.png'),
         )
      )

   );
  }
}
