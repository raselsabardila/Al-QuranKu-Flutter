import 'package:alquranku/models/SurahModel.dart';
import 'package:alquranku/providers/SearchProvider.dart';
import 'package:alquranku/views/components/searchscreen/ItemsSearchComponent.dart';
import 'package:alquranku/views/components/searchscreen/NullSearchComponent.dart';
import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<SearchProvider>(
        create: (context) => SearchProvider(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 30, right: 20, left: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                color: primaryGreen.withOpacity(0.08),
                                offset: Offset(0, 4)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.search, size: 22, color: netralBlack),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.45,
                            child: Consumer(
                              builder:
                                  (context, SearchProvider searchProvider, _) =>
                                      TextField(
                                onChanged: (value) {
                                  searchProvider.search = this._controller.text;
                                },
                                controller: this._controller,
                                decoration: InputDecoration(
                                    hintText: "Search surah...",
                                    hintStyle: smallTextStyleRegular.copyWith(
                                        color: netralBlack.withOpacity(0.6),
                                        fontSize: 15),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer(
                        builder: (context, SearchProvider searchProvider, _) =>
                            Column(
                              children: <Widget>[
                                AnimatedSwitcher(
                                  child: (searchProvider.search.length != 0)
                                      ? ItemsSearchComponent()
                                      : NullSearchComponent(),
                                  duration: Duration(milliseconds: 300),
                                ),
                                SizedBox(height: 5),
                                (searchProvider.search.length != 0)
                                    ? GestureDetector(
                                        onTap: () {
                                          searchProvider.clearAll();
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              color: primaryGreen,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4),
                                                    color: primaryGreen
                                                        .withOpacity(0.3))
                                              ]),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(Icons.cancel_rounded,
                                                  size: 22,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text("CLEAR",
                                                  style: mediumTextStyleRegular
                                                      .copyWith(
                                                          color: Colors.white,
                                                          letterSpacing: 0.5))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            )),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
