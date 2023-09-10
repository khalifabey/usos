import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Import the camera package
import 'DisplayPictureScreen.dart';
import 'camerabutton.dart';
import 'camerascreen.dart';
import 'nextpage.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () async {
                final cameras = await availableCameras();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraButton()),
                );
              },
              child: Icon(Icons.arrow_back_ios_sharp,
                  color: Colors.white, size: screenWidth * 0.07),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(screenWidth * 0.02),
                backgroundColor: Color(0xff1E1E1E),
                foregroundColor: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            height: screenHeight * 0.3,
            child: Card(
              elevation: 6,
              color: Colors.amber.shade100,
              semanticContainer: true,
              child: InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                onTap: () async {
                  final cameras = await availableCameras();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplayPictureScreen(imagePath: '',)),
                  );
                },
                child: Ink.image(
                  width: double.infinity,
                  height: screenHeight * 0.28,
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/routier.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            height: screenHeight * 0.3,
            child: Card(
              elevation: 6,
              color: Colors.amber.shade100,
              semanticContainer: true,
              child: InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                onTap: () async {
                  final cameras = await availableCameras();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraScreen()),
                  );
                },
                child: Ink.image(
                  width: double.infinity,
                  height: screenHeight * 0.28,
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/civil.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            height: screenHeight * 0.3,
            child: Card(
              elevation: 6,
              color: Colors.amber.shade100,
              semanticContainer: true,
              child: InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                onTap: () async {
                  final cameras = await availableCameras();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraScreen()),
                  );
                },
                child: Ink.image(
                  width: double.infinity,
                  height: screenHeight * 0.28,
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/TRAV.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}