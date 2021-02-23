import 'dart:async';

import 'package:alquranku/controllers/ApiController.dart';
import 'package:alquranku/models/LoadingModel.dart';
import 'package:alquranku/models/SurahModel.dart';
import 'package:alquranku/models/WidgetModel.dart';
import 'package:alquranku/views/components/BottomNavigationComponent.dart';
import 'package:alquranku/views/components/homescreen/HomeScreen.dart';
import 'package:flutter/material.dart';

class AlQuranScreen extends StatefulWidget {
  @override
  _AlQuranScreenState createState() => _AlQuranScreenState();
}

class _AlQuranScreenState extends State<AlQuranScreen> {
  _AlQuranScreenState() {
    if (LoadingModel.loading) {
      this.getSurah("https://api.quran.sutanlab.id/surah").then((_) {
        Timer(Duration(seconds: 3), () {
          setState(() {
            WidgetModel.widget = HomeScreen();
            LoadingModel.loadingBottomBar = false;
          });
        });
      });
    }
  }

  Future getSurah(String url) async {
    var result = await ApiController.getResponse(url);
    SurahModel.surah = result["data"];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: AnimatedSwitcher(
            child: WidgetModel.widget,
            duration: Duration(milliseconds: 500),
          ),
        )),
        bottomNavigationBar: (LoadingModel.loadingBottomBar)
            ? null
            : BottomNavigationComponent(0),
      ),
    );
  }
}
