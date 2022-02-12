import 'package:flutter/material.dart';
import 'signup.dart';
import 'titleApp.dart';
import 'package:google_fonts/google_fonts.dart';

import 'formes/formeContainer.dart';
import 'welcomePage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _darkModeButton() {
    return Switch(
      value: isSwitched,
      activeTrackColor: Colors.white,
      activeColor: Colors.white,
      inactiveTrackColor: Colors.black,
      inactiveThumbColor: Colors.black,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          Color c = wh;
          wh = bk;
          bk = c;
          Color cc = blc;
          blc = or;
          or = cc;
          Color ccc = orc;
          orc = blff;
          blff = ccc;
        });
      },
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: bk,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            //controller: TextEditingController(text:user.email),
              obscureText: isPassword,
              decoration: InputDecoration(
                  //border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: FillColor,
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      //width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomLeft,
              colors: [blff, blc])),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: wh),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: bk,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: blc, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: wh,
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * .27,
              right: -width * .3,
              child: FormeContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * 8 / 100),
                      TitleApp(context),
                      SizedBox(height: height * 6 / 100),
                      Icon(
                        Icons.login_rounded,
                        size: 65,
                        color: bk,
                      ),
                      SizedBox(height: height * 2 / 100),
                      _emailPasswordWidget(),
                      SizedBox(height: height * 4 / 100),
                      _submitButton(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: height * 2 / 100),
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: bk,
                            )),
                      ),
                      SizedBox(height: height * .034),
                      _createAccountLabel(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: height * 4 / 100, left: 0, child: backButton(context)),
            Positioned(
                top: height * .04, right: 0, child: _darkModeButton()),
          ],
        ),
      ),
    );
  }
}
