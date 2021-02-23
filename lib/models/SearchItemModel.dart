class SearchItemModel {
  static List _surah = [];

  static List get surah => SearchItemModel._surah;
  static set surah(List surah) {
    SearchItemModel._surah = surah;
  }
}