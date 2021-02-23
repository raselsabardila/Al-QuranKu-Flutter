import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';

class Ayat extends StatelessWidget {
  String _ayatAr, _arti, _ayatInd;
  int _ayat;

  Ayat(this._ayat, this._ayatAr, this._ayatInd, this._arti);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primaryGreen),
                child: Center(
                  child: Text(
                    "${this._ayat}",
                    style: mediumTextStyleMedium.copyWith(color: Colors.white),
                  ),
                )),
            SizedBox(width: 5),
            Container(
              width: MediaQuery.of(context).size.width / 1.27,
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.27,
                      child: Text(
                        "${this._ayatAr}",
                        textAlign: TextAlign.right,
                        style: mediumTextStyleMedium.copyWith(
                            color: netralBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${this._ayatInd}",
                        textAlign: TextAlign.justify,
                        style: smallTextStyleRegular.copyWith(
                            color: primaryGreen,
                            letterSpacing: 0.5,
                            height: 1.5)),
                    SizedBox(height: 8),
                    Text("${this._arti}",
                        textAlign: TextAlign.justify,
                        style: smallTextStyleRegular.copyWith(
                            color: netralBlack,
                            letterSpacing: 0.5,
                            height: 1.5))
                  ],
                )
              ]),
            )
          ]),
    );
  }
}