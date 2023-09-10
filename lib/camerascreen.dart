import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'DisplayPictureScreen.dart';
import 'main.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  bool _isCameraPermissionGranted = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    getPermissionStatus();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;

    if (status.isGranted) {
      setState(() {
        _isCameraPermissionGranted = true;
      });
      onNewCameraSelected(cameras[0]); // Use the first available camera
    }
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    final cameras = await availableCameras();

    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await previousCameraController?.dispose();

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  Future<void> takeAndDisplayPicture() async {
    XFile? rawImage = await takePicture();
    File imageFile = File(rawImage!.path);

    int currentUnix = DateTime.now().millisecondsSinceEpoch;
    final directory = await getApplicationDocumentsDirectory();
    String fileFormat = imageFile.path.split('.').last;

    await imageFile.copy('${directory.path}/$currentUnix.$fileFormat');

    String imagePath = '${directory.path}/$currentUnix.$fileFormat';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(imagePath: imagePath),
      ),
    );
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;

    if (cameraController!.value.isTakingPicture) {
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occurred while taking a picture: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full screen width
      height: double.infinity, // Full screen height
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: _isCameraInitialized
              ? Column(
            children: [

              Expanded(
                child: AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: CameraPreview(controller!),
                ),

              ),
              SizedBox(height: 16),

              InkWell(
                onTap: takeAndDisplayPicture,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white38,
                      size: 80,
                    ),
                    Icon(
                      Icons.circle,
                      color:  Colors.white,
                      size: 65,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

            ],
          )
              : Center(
            child: Text(
              'LOADING',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
