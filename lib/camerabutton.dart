import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Import the camera package
import 'camerascreen.dart';
import 'nextpage.dart';

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
            height: 150,
            width: 500,
                   child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment(-1.0, -0.3),
                      child: Image.asset(
                        'lib/assets/pq.png',
                        height: 140,
                        width: 140,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(90, 115, 10, 2),
                      child: Text("KIRIBIS", style: TextStyle(color: Color(0xFFAACC00), fontSize: 25.0, fontWeight: FontWeight.w900,),
                      ),
                    ),

    ],
              ),
    ),

          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
                color: Color(0xff1E1E1E),
                border: Border.all(
                    color: Color(0xFFAACC00),
                    width: 2.0),
                borderRadius: BorderRadius.all(
                    Radius.circular(20.0)),
            ),
            height: 550,
            width: 350,
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
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
              Padding(
                padding: EdgeInsets.fromLTRB(200, 240, 4, 2),
                  child: Image.asset(
                    'lib/assets/img.png',
                  ),
              ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
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
                    MaterialPageRoute(builder: (context) => NextPage()),
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
