import 'package:alquranku/models/SearchItemModel.dart';
import 'package:alquranku/views/components/homescreen/SurahItemList.dart';
import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';

class ItemsSearchComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50),
        Text("Result Search(${SearchItemModel.surah.length})",
            style: mediumTextStyleMedium.copyWith(color: netralBlack)),
        SizedBox(height: 30),
        GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 3.7,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(SearchItemModel.surah.length, (index) {
            return SurahItemList(
                SearchItemModel.surah[index]["name"]["transliteration"]["id"],
                SearchItemModel.surah[index]["name"]["translation"]["id"],
                SearchItemModel.surah[index]["name"]["short"],
                SearchItemModel.surah[index]["numberOfVerses"],
                SearchItemModel.surah[index]["number"]);
          }),
        )
      ],
    );
  }
}
