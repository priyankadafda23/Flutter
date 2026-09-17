import 'package:flutter/material.dart';
import '../resources/imagestring.dart';

class ImageDisp extends StatefulWidget {
  const ImageDisp({super.key});

  @override
  State<ImageDisp> createState() => _ImageDispState();
}

class _ImageDispState extends State<ImageDisp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(i2[6], height: 1000),
          ],
        ),
      ),
    );
  }
}