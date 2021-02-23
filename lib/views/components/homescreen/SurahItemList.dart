import 'package:alquranku/views/screens/DetailSurahScreen.dart';
import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';

class SurahItemList extends StatelessWidget {
  int _id, _ayat;
  String _surah, _arti, _arab;

  SurahItemList(this._surah, this._arti, this._arab, this._ayat, this._id);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailSurahScreen(this._id);
        }));
      },
      child: Container(
        width: double.infinity,
        height: 70,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  color: primaryGreen.withOpacity(0.08))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${this._surah}",
                  style: mediumTextStyleMedium.copyWith(color: primaryGreen),
                ),
                Text(
                  "${this._arti} | ${this._ayat} ayat",
                  style: smallTextStyleRegular.copyWith(
                      color: netralBlack.withOpacity(0.5)),
                )
              ],
            ),
            Center(
              child: Text(
                "${this._arab}",
                style: bigTextStyle.copyWith(
                  color: primaryGreen,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
