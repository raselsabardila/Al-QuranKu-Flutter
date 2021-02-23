import 'package:alquranku/views/components/BottomNavigationComponent.dart';
import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Fortis Fortuna Adiuvat",
                style: bigTextStyle.copyWith(color: primaryGreen),
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                            color: primaryGreen,
                            style: BorderStyle.solid,
                            width: 3)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 132,
                            height: 132,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/rasel.jpeg"),
                                    fit: BoxFit.cover)))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Rachel Sabardila",
                    style: mediumTextStyleMedium.copyWith(
                        color: netralBlack, letterSpacing: 0.5),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "@raselsabardila_",
                    style: smallTextStyleRegular.copyWith(color: primaryGreen),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                    textAlign: TextAlign.justify,
                    style: smallTextStyleRegular.copyWith(color: netralBlack, height: 1.8, letterSpacing: 0.5),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationComponent(1),
      ),
    );
  }
}
