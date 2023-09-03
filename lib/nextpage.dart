import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:usos/thankyou.dart';

import 'DisplayPictureScreen.dart';
import 'camerabutton.dart';
import 'camerascreen.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String selectedChoice = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),

      body:Column(
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
            child: Icon(Icons.arrow_back_ios_sharp, color: Colors.white, size: 35),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(10),
              backgroundColor: Color(0xff1E1E1E),
              foregroundColor: Colors.white,

            ),
          ),
        ),
          SizedBox(
            width: 400,
            height: 270,
            child: Card(
              elevation: 6,
              color: Colors.amber.shade100,
              semanticContainer: true,
              // Implement InkResponse
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
                // Add image & text
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink.image(
                        width: double.infinity,
                        height: 262,
                        fit: BoxFit.cover,
                        image: const AssetImage('lib/assets/routier.png')),
                    //const Text(
                     // 'The Big Boss',
                     // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    //),
                   // const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          ),
      SizedBox(
        width: 400,
        height: 270,
        child: Card(
          elevation: 6,
          color: Colors.amber.shade100,
          semanticContainer: true,
          // Implement InkResponse
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
            // Add image & text
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Ink.image(
                    width: double.infinity,
                    height: 262,
                    fit: BoxFit.cover,
                    image: const AssetImage('lib/assets/civil.png')),
                //const Text(
                // 'The Big Boss',
                // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                //),
                // const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        width: 400,
        height: 270,
        child: Card(
          elevation: 6,
          color: Colors.amber.shade100,
          semanticContainer: true,
          // Implement InkResponse
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
            // Add image & text
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Ink.image(
                    width: double.infinity,
                    height: 262,
                    fit: BoxFit.cover,
                    image: const AssetImage('lib/assets/TRAV.png')),
                //const Text(
                // 'The Big Boss',
                // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                //),
                // const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final String choice;
  final String selectedChoice;
  final VoidCallback onSelect;

  ChoiceButton({
    required this.choice,
    required this.selectedChoice,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSelect,
      style: ElevatedButton.styleFrom(
        primary: selectedChoice == choice ? Colors.green : Colors.grey,
      ),
      child: Text(choice),
    );
  }
}
