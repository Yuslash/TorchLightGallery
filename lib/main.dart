import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  bool isMonochrome = true;
  bool isTorchOn = false;
  late String selectedImage;

  final List<String> images = [
    'images/gen.jpg',
    'images/giv.jpeg',
    'images/giv3.jpeg',
    'images/kam.jpeg',
    'images/kan.jpeg',
    'images/nez.jpeg',
    'images/nez2.jpeg',
    'images/ren.jpeg',
    'images/ren2.jpeg',
    'images/ren3.jpeg',
    'images/suk.jpeg',
    'images/tan.jpeg',
    'images/tan2.jpeg',
    'images/yu.jpeg',
    'images/zen.jpeg',
    'images/zen2.jpeg',
    'images/zen3.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    selectedImage = images[Random().nextInt(images.length)] ;
  }

  void onToggle() async {
  
    setState(() {
      isMonochrome = !isMonochrome;
      isTorchOn = !isTorchOn;
      });
    isTorchOn ? await TorchLight.enableTorch() : await TorchLight.disableTorch() ;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: GestureDetector(
          onTap: onToggle,
          child: SizedBox.expand(
            child: Stack(
              children: [
                Positioned.fill(child: Image.asset(
                    selectedImage, fit: BoxFit.cover,),),
                Positioned.fill(child: AnimatedOpacity(opacity: isMonochrome ? 1.0 : 0.0, 
                duration: const Duration(milliseconds: 150),
                child: ColorFiltered(colorFilter: const ColorFilter.mode(Colors.black, BlendMode.saturation), 
                child: Image.asset(selectedImage, fit: BoxFit.cover),
                ),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}