import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:usos/thankyou.dart';
import 'camerascreen.dart';
import 'nextpage.dart'; // Import the next page class

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () async {
                final cameras = await availableCameras();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraScreen()),
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
    Container(
         decoration: BoxDecoration(
             color: Color(0xff1E1E1E),
             borderRadius: BorderRadius.all(
           Radius.circular(20.0)),
    ),
      height: 300,
      width: 350,
             child: Container(
          decoration: BoxDecoration(
          color: Color(0xFFAACC00),
          borderRadius: BorderRadius.all(
          Radius.circular(20.0)),
               ),
          height: 150,
            width: 175,
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Image.file(File(imagePath)),
             ),
    ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xff1E1E1E),
              border: Border.all(
                  color: Color(0xFFAACC00),
                  width: 2.0),
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0)),
            ),
            height: 300,
            width: 350,
           child: Column(
              children:[
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Text("DATE:\n ADRESSE:\n"),
            ),
                   Align(
                   alignment: Alignment.bottomCenter,
                       child: TextFormField(
                  initialValue: 'Input text',
                  maxLength: 200,
                  decoration: InputDecoration(

                    prefixIcon: Icon(Icons.notes),
                    labelText: 'Votre commentaire',
                    labelStyle: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                    helperText: "Facultatif, \n si vous aviez plus d'informations sur la situation !",
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                enabledBorder: OutlineInputBorder(
                 borderSide:
                   BorderSide(width: 2, color: Color(0xFFAACC00)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  ),
                ),
              ),
              ],
          ),
          ),
              SizedBox(height: 30),
              Container(

              child: Align(
              alignment: Alignment.bottomCenter,

                 child: ElevatedButton(
                  onPressed: () {
                   Navigator.push(
                   context,
                     MaterialPageRoute(builder: (context) => ThankYouPage()),
              );

            },
                   child: Text('Suivant',),
                   style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20.0)
                           ),
                     padding: EdgeInsets.all(15),
                     backgroundColor: Color(0xFFAACC00),
                     foregroundColor: Colors.white,

                   ),


          ),
          ),
          ),
        ],
      ),
    );
  }
}
