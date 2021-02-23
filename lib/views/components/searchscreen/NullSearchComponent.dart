import 'package:flutter/material.dart';

class NullSearchComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 7),
          child: Image(
            image: AssetImage("assets/images/search2.png"),
          )),
    );
  }
}
