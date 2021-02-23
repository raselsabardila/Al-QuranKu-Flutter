class SurahModel {
  static List _surah = [];

  static List get surah => SurahModel._surah;
  static set surah(List surah) {
    SurahModel._surah.addAll(surah);
  }
}