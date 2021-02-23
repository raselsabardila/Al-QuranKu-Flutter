import 'package:alquranku/models/SearchItemModel.dart';
import 'package:alquranku/models/SurahModel.dart';
import 'package:flutter/foundation.dart';

class SearchProvider with ChangeNotifier {
  String _search = "";
  List _itemSearch = [];

  String get search => this._search;
  set search(String search) {
    this._search = search;

    SearchItemModel.surah.clear();
    if (this._search.length != 0) {
      this.setItemSurahSearch();
    }

    notifyListeners();
  }

  void setItemSurahSearch() {
    List surah = SurahModel.surah
        .where((element) => element["name"]["transliteration"]["id"]
            .toLowerCase()
            .contains(this.search.toLowerCase()))
        .toList();

    SearchItemModel.surah = surah.toList();
  }

  void clearAll() {
    SearchItemModel.surah.clear();
    this._search = "";

    notifyListeners();
  }
}
