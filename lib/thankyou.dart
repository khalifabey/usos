import 'package:flutter/material.dart';

import 'camerabutton.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Infraction envoyée',
              style: TextStyle(fontSize: 25,
                color: Color(0xFFAACC00)
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the CameraButton page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CameraButton()),
                );
              },
              child: Icon(Icons.home, color: Colors.black54, size: 35),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(25),
                side: BorderSide(color: Color(0xff1E1E1E), width: 10),
                backgroundColor: Colors.white60,
                foregroundColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
