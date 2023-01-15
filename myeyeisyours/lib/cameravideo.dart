import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'camera_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const IconData camera_alt_rounded =
      IconData(0xf60b, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 170),
            IconButton(
              icon: const Icon(
                Icons.photo_camera,
              ),
              padding: EdgeInsets.all(20),
              onPressed: () async {
                await availableCameras().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPage(
                        cameras: value,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 300),
            IconButton(
              icon: const Icon(
                Icons.videocam,
              ),
              padding: EdgeInsets.all(20),
              onPressed: () async {
                await availableCameras().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPage(
                        cameras: value,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
