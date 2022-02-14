import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'signup.dart';
import 'titleApp.dart';
import '../main.dart';

Color bk = Colors.black;
Color wh = Colors.white;
Color blc = Color.fromRGBO(94, 113, 235, 1);
Color blf = Color.fromRGBO(255, 255, 255, 1);
Color blff = Color.fromRGBO(100, 113, 235, 0.7);
Color or = Color.fromRGBO(255, 208, 77, 1);
Color orc = Color.fromRGBO(255, 218, 97, 0.7);

Color FillColor = Color(0xffabced6);
bool isSwitched = false;

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

Widget backButton(context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      //padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
            child: Icon(Icons.keyboard_arrow_left, color: bk),
          ),
          Text(
            'Back',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: bk,
            ),
          )
        ],
      ),
    ),
  );
}

Widget logo(context) {
  return Container(
      margin: EdgeInsets.only(top: 40, bottom: 20),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Icon(Icons.directions_bus_outlined, size: 105, color: blff),
          SizedBox(
            height: 20,
          ),
        ],
      ));
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _signInButton() {
    return InkWell(
      onTap: () {
        print("i = $i");
        i++;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        //margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: wh.withAlpha(100),
                offset: Offset(2, 4),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
            color: blc),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: bk),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11),
          ),
          border: Border.all(color: blc, width: 2),
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: blc),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [blf, blc])),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                TitleApp(
                  context,
                ),
                SizedBox(
                  height: 80,
                ),
                _signInButton(),
                SizedBox(
                  height: 45,
                ),
                _signUpButton(),
                SizedBox(
                  height: 20,
                ),
                //logo(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
