import 'package:alquranku/views/screens/AlQuranScreen.dart';
import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryGreen));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Quran Ku',
      debugShowCheckedModeBanner: false,
      home: AlQuranScreen(),
    );
  }
}