import 'package:alquranku/controllers/ApiController.dart';
import 'package:alquranku/views/components/destailsurah/Ayat.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';

class DetailSurahScreen extends StatefulWidget {
  int _id;

  DetailSurahScreen(this._id);

  @override
  _DetailSurahScreenState createState() => _DetailSurahScreenState(this._id);
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  int _id, _ayatCount;
  String _surah, _arti, _arab;
  List _ayat = [];
  bool _loading = true;
  String _dropdownValue = "";
  String _durasi = "00.00";
  AudioPlayer _audioPlayer = new AudioPlayer();
  bool _playAudio = false;

  _DetailSurahScreenState(this._id) {
    this._audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        this._durasi = event.toString();
      });

      this._audioPlayer.onPlayerCompletion.listen((event) {
        setState(() {
          this._playAudio = false;
          this._durasi = "00.00";
        });
      });
    });
    this._audioPlayer.setReleaseMode(ReleaseMode.STOP);

    this.getSurah("https://api.quran.sutanlab.id/surah/${this._id}").then((_) {
      this._dropdownValue = this._ayat[0]["audio"]["primary"];

      setState(() {
        this._loading = false;
      });
    });
  }

  void play(String url) async {
    this._playAudio = true;
    await this._audioPlayer.play(url);
  }

  void stop() async {
    this._playAudio = false;
    await this._audioPlayer.stop();
  }

  void pause() async {
    this._playAudio = false;
    await this._audioPlayer.pause();
  }

  void nextOrPrevious(bool next) {
    this._durasi = "00.00";

    List<String> listSplit = this._dropdownValue.split("/");
    StringBuffer newValueDropdown = StringBuffer();

    listSplit[7] = (next)
        ? (int.parse(listSplit[7]) + 1).toString()
        : (int.parse(listSplit[7]) - 1).toString();

    for (var i = 0; i < listSplit.length; i++) {
      if (i < listSplit.length - 1) {
        newValueDropdown.write("${listSplit[i]}/");
      } else {
        newValueDropdown.write("${listSplit[i]}");
      }
    }

    this.stop();
    this._dropdownValue = newValueDropdown.toString();
  }

  Future getSurah(String url) async {
    var result = await ApiController.getResponse(url);

    this._surah = result["data"]["name"]["transliteration"]["id"];
    this._arti = result["data"]["name"]["translation"]["id"];
    this._arab = result["data"]["name"]["short"];
    this._ayatCount = result["data"]["numberOfVerses"];
    this._ayat.addAll(result["data"]["verses"]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: netralBlack,
            ),
          ),
          title: (this._loading)
              ? null
              : Text(
                  "${this._surah}",
                  style: bigTextStyle.copyWith(color: primaryGreen),
                ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: (this._loading)
                  ? this._generateLoading()
                  : this._generateWidget(),
            ),
          ),
        ),
        floatingActionButton: (this._loading)
            ? SizedBox()
            : Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 4),
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryGreen),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              if (this._dropdownValue !=
                                  this._ayat[0]["audio"]["primary"]) {
                                setState(() {
                                  this.nextOrPrevious(false);
                                });
                              }
                            },
                            child: Icon(Icons.skip_previous_rounded,
                                size: 25,
                                color: (this._dropdownValue ==
                                        this._ayat[0]["audio"]["primary"])
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                (this._playAudio)
                                    ? this.pause()
                                    : this.play(this._dropdownValue);
                              });
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Center(
                                  child: Icon(
                                (this._playAudio)
                                    ? Icons.stop_rounded
                                    : Icons.play_arrow_rounded,
                                color: primaryGreen,
                                size: 28,
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (this._dropdownValue !=
                                  this._ayat[this._ayat.length - 1]["audio"]
                                      ["primary"]) {
                                setState(() {
                                  this.nextOrPrevious(true);
                                });
                              }
                            },
                            child: Icon(Icons.skip_next_rounded,
                                size: 25,
                                color: (this._dropdownValue ==
                                        this._ayat[this._ayat.length - 1]
                                            ["audio"]["primary"])
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          DropdownButton(
                            value: this._dropdownValue,
                            iconEnabledColor: Colors.white,
                            iconSize: 20,
                            onChanged: (newValue) {
                              setState(() {
                                this.stop();
                                this._dropdownValue = newValue;
                              });
                            },
                            style: smallTextStyleMedium.copyWith(
                                color: Colors.white),
                            underline: Container(),
                            dropdownColor: primaryGreen,
                            items: this._ayat.map((value) {
                              return DropdownMenuItem(
                                value: value["audio"]["primary"],
                                child: Text(
                                  "Ayat ke ${value["number"]["inSurah"]}",
                                  style: smallTextStyleMedium,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      this._durasi,
                      style:
                          smallTextStyleRegular.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _generateLoading() {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(primaryGreen),
          strokeWidth: 5,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  Widget _generateWidget() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [primaryGreen.withOpacity(0.55), primaryGreen]),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "${this._surah}",
                    style: bigTextStyle.copyWith(color: Colors.white),
                  ),
                  Text(
                    "${this._arti} | ${this._ayatCount} ayat",
                    style: smallTextStyleRegular.copyWith(
                        color: Colors.white.withOpacity(0.8)),
                  )
                ],
              ),
              Text(
                "${this._arab}",
                style: bigTextStyle.copyWith(color: Colors.white, fontSize: 60),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        Column(
          children: List.generate(this._ayat.length, (index) {
            return Ayat(
                index + 1,
                this._ayat[index]["text"]["arab"],
                this._ayat[index]["text"]["transliteration"]["en"],
                this._ayat[index]["translation"]["id"]);
          }),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        )
      ],
    );
  }
}
