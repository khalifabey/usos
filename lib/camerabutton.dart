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
        children:[
            Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100)),
                color: Color(0x7faacc00)),
            height: 200,
            width: 500,
              child: const Padding(
              padding: EdgeInsets.fromLTRB(280, 165, 4, 2),
                child: Text("KIRIBIS", style: TextStyle(color: Color(0xFFAACC00), fontSize: 25.0, fontWeight: FontWeight.w900,),
            ),
          ),
              
        ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
                color: Color(0xff1E1E1E),
                border: Border.all(
                    color: Color(0xFFAACC00),
                    width: 3.0),
                borderRadius: BorderRadius.all(
                    Radius.circular(20.0)),
            ),
            height: 500,
            width: 350,
            child: Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
             child: Text("Prendre une photo de la voiture fautive. Assurez-vous que toute la voiture et les numéros sur la plaque sont visibles."),
          ),
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFAACC00),
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0)),
            ),
            height: 80,
            width: 350,
            padding: EdgeInsets.symmetric(vertical: 0),

          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0),
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
                child: Icon(Icons.camera_alt, color: Colors.black54, size: 35),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(25),
                  side: BorderSide(color: Color(0xff1E1E1E), width: 10),
                  backgroundColor: Colors.white60,
                  foregroundColor: Colors.orange,
                ),

              ),

            ),
          ),
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}
