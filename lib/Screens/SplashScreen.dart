import 'dart:async';
import 'package:gradient_text/gradient_text.dart';
import 'package:animated_login_page/Screens/Login.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.black;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.greenAccent);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String _versionName = 'V' + version;
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => loginpage()));
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.tealAccent,
                                backgroundImage: AssetImage('assets/images/splash.png'),
                                radius: 80.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                              ),
                            ],
                          )),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text("from",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300),),
                          Container(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GradientText("PHANTOM DECODERS",
                                  gradient: LinearGradient(colors: [
                                    Color(0xFFFF1000),
                                    Color(0xFF2508FF),
                                  ]),
                                  style: TextStyle(
                                      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.green),),
                              ])
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}