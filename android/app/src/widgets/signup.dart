import 'package:flutter/material.dart';
import 'formes/formeContainer.dart';
import 'loginPage.dart';
import 'titleApp.dart';
import 'welcomePage.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  Widget _entryField(String title,
      {bool isPassword = false, String hint = ''}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: bk),
          ),
          SizedBox(
            height: 6,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  fillColor: FillColor,
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomLeft,
              colors: [blff, blc])),
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: wh),
      ),
    );
  }

  Widget _loginAccountLabel() {
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: bk),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: blc, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldsWidget() {
    return Column(
      children: <Widget>[
        _entryField("Firstname"),
        _entryField("Lastname"),
        _entryField("Age"),
        _entryField("Address"),
        _entryField("Profession"),
        _entryField("Email"),
        _entryField("Password",
            isPassword: true, hint: 'At least 6 characters'),
        _entryField("Re-enter password"),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .07),
                      TitleApp(context),
                      SizedBox(height: height * .05),
                      Icon(
                        Icons.person_add_alt_1_rounded,
                        size: 65,
                        color: blc,
                      ),
                      _fieldsWidget(),
                      SizedBox(
                        height: height * .04,
                      ),
                      _submitButton(),
                      SizedBox(height: height * .04),
                      _loginAccountLabel(),
                      Positioned(
                          top: 0, left: 0, child: backButton(context)),
                      Positioned(
                          top: 0, right: 0, child: _darkModeButton()),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
