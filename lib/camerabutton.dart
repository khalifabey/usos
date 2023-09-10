import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Import the camera package
import 'camerascreen.dart';
import 'nextpage.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
              color: Color(0x7faacc00),
            ),
            height: screenHeight * 0.2,
            width: screenWidth * 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment(-1.0, -0.3),
                  child: Image.asset(
                    'lib/assets/pq.png',
                    height: screenHeight * 0.18,
                    width: screenHeight * 0.18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(90, 140, 8, 2),
                  child: Text(
                    "KIRIBIS",
                    style: TextStyle(
                      color: Color(0xFFAACC00),
                      fontWeight: FontWeight.w900,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff1E1E1E),
              border: Border.all(
                color: Color(0xFFAACC00),
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(screenWidth * 0.05),
              ),
            ),
            height: screenHeight * 0.55,
            width: screenWidth * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\n Prendre une photo de la voiture fautive. \n \n Assurez-vous que toute la voiture et les numéros sur la plaque sont visibles.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.57,
                      screenHeight * 0.3,
                      4,
                      2,
                    ),
                    child: Image.asset(
                      'lib/assets/img.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFAACC00),
              borderRadius: BorderRadius.all(
                Radius.circular(screenWidth * 0.05),
              ),
            ),
            height: screenHeight * 0.09,
            width: screenWidth * 0.8,
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
                      MaterialPageRoute(builder: (context) => NextPage()),
                    );
                  },
                  child: Icon(Icons.camera_alt_outlined,
                      color: Colors.orange, size: screenWidth * 0.1),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    side: BorderSide(color: Colors.orange, width: 2),
                    backgroundColor: Colors.black54,
                    foregroundColor: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}