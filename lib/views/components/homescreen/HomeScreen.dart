import 'package:alquranku/models/SurahModel.dart';
import 'package:alquranku/views/components/homescreen/SurahItemList.dart';
import 'package:alquranku/views/screens/SearchScreen.dart';
import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Al-Quran Ku",
                    style: bigTextStyle.copyWith(color: primaryGreen),
                  ),
                  Text(
                    "Bacalah walau 1 ayat",
                    style: smallTextStyleRegular.copyWith(color: netralBlack),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  return Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return SearchScreen();
                  }));
                },
                child: Icon(
                  Icons.search,
                  color: netralBlack,
                  size: 28,
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            children: List.generate(SurahModel.surah.length, (index) {
              return SurahItemList(
                  SurahModel.surah[index]["name"]["transliteration"]["id"],
                  SurahModel.surah[index]["name"]["translation"]["id"],
                  SurahModel.surah[index]["name"]["short"],
                  SurahModel.surah[index]["numberOfVerses"],
                  SurahModel.surah[index]["number"]);
            }),
          )
        ],
      ),
    );
  }
}
