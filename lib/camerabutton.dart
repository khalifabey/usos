import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Import the camera package
import 'camerascreen.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final cameras = await availableCameras();
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen()),
        );
      },
            child: Icon(Icons.camera_alt, color: Colors.black54, size: 37),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
              backgroundColor: Colors.white60, // <-- Button color
              foregroundColor: Colors.orange, // <-- Splash color
            ),
    )
   ]
    ));
  }
}
