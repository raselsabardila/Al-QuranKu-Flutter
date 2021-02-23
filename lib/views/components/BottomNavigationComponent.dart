import 'package:alquranku/views/components/ItemBottomNavigationComponent.dart';
import 'package:alquranku/views/screens/AlQuranScreen.dart';
import 'package:alquranku/views/screens/ProfileScreen.dart';
import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';

class BottomNavigationComponent extends StatelessWidget {
  int _active;
  List<ItemBottomNavigationComponent> _widget = [
    ItemBottomNavigationComponent("Home", Icons.home_rounded, AlQuranScreen()),
    ItemBottomNavigationComponent(
        "Profile", Icons.supervised_user_circle, ProfileScreen())
  ];

  BottomNavigationComponent(int active,
      {List<ItemBottomNavigationComponent> widget}) {
    if (widget != null) {
      this._widget.addAll(widget);
    }

    this._active = active;

    for (var i = 0; i < this._widget.length; i++) {
      if (i == this._active) {
        this._widget[i].active = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: primaryGreen.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, -4))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: this._widget,
      ),
    );
  }
}
