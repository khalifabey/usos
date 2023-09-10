import 'package:flutter/material.dart';
import 'camerabutton.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Infraction envoyée',
              style: TextStyle(
                fontSize: screenWidth * 0.05, // Adjust font size based on screen width
                color: Color(0xFFAACC00),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the CameraButton page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CameraButton()),
                );
              },
              child: Icon(Icons.home_outlined, color: Colors.orange, size: screenWidth * 0.1), // Adjust icon size based on screen width
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(screenWidth * 0.05), // Adjust padding based on screen width
                side: BorderSide(color: Colors.orange, width: 2),
                backgroundColor:  Colors.black54,
                foregroundColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}