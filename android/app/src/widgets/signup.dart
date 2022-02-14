import 'dart:convert';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Classes/Passenger.dart';
import 'Dashboard.dart';
import 'formes/formeContainer.dart';
import 'package:http/http.dart' as http;

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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  late String birthDateInString;
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;

  //DateTime birthDate;
  String test = "rt";
  Passenger passenger = Passenger(
    email: "",
    password: "",
    firstname: "",
    lastname: "",
    address: "",
    profession: "",
    //birthday: DateTime(year),
  );
  String url = "http://localhost:8082/registration";

  var _dateTime;

  Future registrate() async {
    print("before send request registration");
    String hh = passenger.email;
    String hhh = passenger.birthday.toString();
    print("dateNais string == $hhh");

    print("email == $hh");
    DateTime dt;
    DateFormat formatter = DateFormat('yyyy-MM-dd'); // use any format
    String formatted = formatter.format(_dateTime);

    print("before sending");
    print(passenger.email);
    print(passenger.password);
    print(passenger.address);
    print(passenger.firstname);
    print(passenger.lastname);
    print(passenger.profession);
    print(passenger.address);
    print(formatted);

    var res = await http.post(Uri.parse(url), // ou url idk
        headers: {
          //"Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          //"Content-Type": "application/json",
          //"Access-Control-Allow-Headers": "*",
          //"Access-Control-Allow-Methods": "POST, OPTIONS",
        }, body: <String, Object>{
      'email': passenger.email,
      'password': passenger.password,
      'address': passenger.address,
      'profession': passenger.profession,
      'lastname': passenger.lastname,
      'firstname': passenger.firstname,
      'birthday': formatted,
    });
    encoding:
    Encoding.getByName('utf-8');

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

  Widget _entryField(String title, Widget widget,
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
          widget
        ],
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        registrate();
      },
      child: Container(
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

  Widget _fieldsWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        _entryField(
            "Firstname",
            TextFormField(
                controller: TextEditingController(text: passenger.firstname),
                onChanged: (val) {
                  passenger.firstname = val;
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Firstname is empty";
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: FillColor,
                    filled: true))),

        _entryField(
            "Lastname",
            TextFormField(
                controller: TextEditingController(text: passenger.lastname),
                onChanged: (val) {
                  passenger.lastname = val;
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Lastname is empty";
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: FillColor,
                    filled: true))),

        _entryField(
            "Date of birth",
            Row(

              children: [
                Text(_dateTime == null
                    ? 'Choose your birthdate '
                    : _dateTime.toString()),
                ElevatedButton(
                    child: Text('Pick a date'),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      ).then((date) {
                        setState(() {
                          _dateTime = date;
                          passenger.birthday=_dateTime;
                        });
                      });
                    })
              ],
            )),

        _entryField(
            "Address",
            TextFormField(
                controller: TextEditingController(text: passenger.address),
                onChanged: (val) {
                  passenger.address = val;
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Address is empty";
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: FillColor,
                    filled: true))),

        _entryField(
            "Profession",
            TextFormField(
                controller: TextEditingController(text: passenger.profession),
                onChanged: (val) {
                  passenger.profession = val;
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Profession is empty";
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: FillColor,
                    filled: true))),

        _entryField(
            "Email",
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
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: FillColor,
                    filled: true))),

        _entryField(
            "Password",
            TextFormField(
                controller: TextEditingController(text: passenger.password),
                onChanged: (val) {
                  passenger.password = val;
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Password is empty";
                    return null;
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'At least 6 characters',
                    border: InputBorder.none,
                    fillColor: FillColor,
                    filled: true))),

        //_entryField("Re-enter password"),
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            backButton(context),
                            _darkModeButton(),
                          ]),
                      SizedBox(height: height * .07),
                      TitleApp(context),
                      SizedBox(height: height * .05),
                      Icon(
                        Icons.person_add_alt_1_rounded,
                        size: 65,
                        color: blc,
                      ),
                      _fieldsWidget(context),
                      SizedBox(
                        height: height * .04,
                      ),
                      _submitButton(),
                      SizedBox(height: height * .04),
                      _loginAccountLabel(),
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
