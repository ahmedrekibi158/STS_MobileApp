import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../Classes/Passenger.dart';
import 'Dashboard.dart';
import 'signup.dart';
import 'titleApp.dart';
import 'package:http/http.dart' as http;
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
  final _formKey = GlobalKey<FormState>();
  Passenger passenger = Passenger(email: "", password: "");
  String url = "http://localhost:8082/login";

  Future save() async {
    print("before send request");
    String hh = passenger.email;
    print("email == $hh");
    var res = await http.post(Uri.parse(url), // ou url idk
        headers: {
          //"Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          //"Content-Type": "application/json",
          //"Access-Control-Allow-Headers": "*",
          //"Access-Control-Allow-Methods": "POST, OPTIONS",
        },
        body: {'email': passenger.email, 'password': passenger.password});
    encoding:Encoding.getByName('utf-8');

    print("response body:: ");
    print(res.body);
    if (res.body != null) {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Dashboard(),
    ));
    }
  }

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

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        //if (_formKey.currentState!.validate()) {
        save();
        //}
      },
      child: Container(
        //width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomLeft,
                colors: [blff, blc])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: wh),
        ),
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
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
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
            const SizedBox(
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
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: bk,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: TextEditingController(text: passenger.email),
                onChanged: (val) {
                  passenger.email = val;
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Email is empty";
                    return null;
                  }
                },
                //controller: TextEditingController(text:user.email),
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: FillColor,
                  filled: true,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: bk,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: TextEditingController(text: passenger.email),
                onChanged: (val) {
                  passenger.email = val;
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Password is Empty';
                  }
                  return null;
                },
                //controller: TextEditingController(text:user.email),
                obscureText: true,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: FillColor,
                  filled: true,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      key: _formKey,
      backgroundColor: wh,
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * .27,
              right: -width * .3,
              child: const FormeContainer(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
            Positioned(top: height * .04, right: 0, child: _darkModeButton()),
          ],
        ),
      ),
    );
  }
}
