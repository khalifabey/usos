import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Import the camera package
import 'camerascreen.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final cameras = await availableCameras();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TakePictureScreen(camera: cameras.first)),
        );
      },
      child: Text('Open Camera'),
    );
  }
}
