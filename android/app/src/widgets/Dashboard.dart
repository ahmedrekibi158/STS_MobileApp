import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'welcomePage.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}
Widget logo(context) {
  return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 20),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Icon(Icons.directions_bus_outlined, size: 105, color: blff),
          const SizedBox(
            height: 20,
          ),
        ],
      ));
}

class _WelcomePageState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions:<Widget> [
            IconButton(onPressed: (){
              //delete token
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()));
            }, icon:const Icon(Icons.logout_rounded)),
          ],

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [blf, blc])),
          child: SingleChildScrollView(
            child: Column(
              
              children: <Widget>[
                logo(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
