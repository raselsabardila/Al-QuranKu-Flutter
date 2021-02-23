import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';

class ItemBottomNavigationComponent extends StatelessWidget {
  bool _active = false;
  String _text;
  IconData _icon;
  Object _class;

  ItemBottomNavigationComponent(this._text, this._icon, this._class);

  set active(bool active) {
    this._active = active;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return this._class;
        }));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            this._icon,
            size: 28,
            color: (this._active) ? primaryGreen : netralBlack.withOpacity(0.5),
          ),
          Text(
            this._text,
            style: smallTextStyleMedium.copyWith(
                color: (this._active)
                    ? primaryGreen
                    : netralBlack.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
