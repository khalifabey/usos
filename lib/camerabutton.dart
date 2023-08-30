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
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(

                    bottomLeft: Radius.circular(100)),
                color: Color(0xFFAACC00)),
            height: 200,
            width: 500,
             ),
          Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
         color: Color(0xFFAACC00)),
            height: 500,
            width: 300,
           ),
          Container(
            color: Color(0xff1E1E1E),
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
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
                  backgroundColor: Colors.white60,
                  foregroundColor: Colors.orange,
                ),
                
              ),

            ),
          ),

        ],
      ),
    );
  }
}
