import 'package:alquranku/views/styles/Style.dart';
import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/img2.png"),
                  width: 200,
                ),
                Text(
                  "Al-Quran Ku",
                  style: bigTextStyle.copyWith(color: netralBlack),
                ),
                SizedBox(height: 28),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(primaryGreen),
                  backgroundColor: Colors.transparent,
                  strokeWidth: 5,
                )
              ],
            ),
          ),
          Spacer(),
          Text("RACHEL SABARDILA PERMANA PUTRA",
              style: mediumTextStyleRegular.copyWith(
                  color: netralBlack.withOpacity(0.5))),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
