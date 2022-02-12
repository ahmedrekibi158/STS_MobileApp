import 'package:flutter/material.dart';
import 'welcomePage.dart';
import 'package:google_fonts/google_fonts.dart';


class TitleApp extends StatelessWidget {
  BuildContext ctx;
  TitleApp(this.ctx);

  Widget build(BuildContext context) {
    context=ctx;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'S',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: blc,
          ),
          children: [
            TextSpan(
              text: 'mar',
              style: TextStyle(color: bk, fontSize: 30),
            ),
            TextSpan(
              text: 'TS',
              style: TextStyle(color: blc, fontSize: 30),
            ),
          ]),
    );

    child:
    Column(
      children: <Widget>[],
    );
  }
}
