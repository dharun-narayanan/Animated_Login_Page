import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_login_page/Animation/signin_button.dart';
import 'package:animated_login_page/Animation/teddy_controller.dart';
import 'package:animated_login_page/Animation/tracking_input.dart';
import 'package:animated_login_page/Widget/bezierContainer.dart';


String _emailController;
String _passwordController;



class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

enum LoginStatus { notSignIn, signIn }

class _loginpageState extends State<loginpage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  static int res = 1;



  TeddyController _teddyController;

  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  Widget _emailbutton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        if(_email.text.contains("@gmail.com")){
        }
        else{
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("NOT AUTHORISED"),
                  content: Text("You are not authorised to change password in this page!!!"),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          res = 0;
                          _teddyController.setres(res);
                          _teddyController.submitPassword();
                        });
                      },
                    )
                  ],
                );
              });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: <BoxShadow>[
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.greenAccent, Colors.green])),
        child: Text(
          'Send Email',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),),

    );
  }

  Widget _Fpass(){
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(20.0)),
                //this right here
                child: Container(
                  height: 228,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment
                          .start,
                      children: [
                        SizedBox(height: 10,),
                        Text("Email Address", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20),),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: _email,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              fillColor: Color(0xfff3f3f4),
                              hintText: 'Enter your email address',
                              hintStyle: TextStyle(color: Colors.black38),
                              filled: true),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              _emailbutton(),
                            ],

                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FlatButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.blue,fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            }
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.centerRight,
        child: Text('Forgot Password ?',
          style: TextStyle(
              color: Colors.black,fontSize: 14, fontWeight: FontWeight.w500),),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Widget _title() {
    return RichText(
      text: TextSpan(
          text: 'Phantom              ',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 50,
            fontWeight: FontWeight.w900,
            color: Colors.green,
          ),
          children: [
            TextSpan(
              text: 'Decoders',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ]),
    );
  }


  @override
  Widget build(BuildContext context)
  {
    final height = MediaQuery.of(context).size.height;
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(

      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.0, 1.0],
                        colors: [Color(0xFF143642), Color(0xFF26667d)],
                      ),
                    ),
                  )),
              Stack(
                children: <Widget>[
                  Positioned(
                      top: -height * .15,
                      right: -MediaQuery
                          .of(context)
                          .size
                          .width * .4,
                      child: BezierContainer()),
                  Container(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
                                child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      _title(),
                                    ]
                                ),
                              ),
                            ),
                            SizedBox(height: 50,),
                            Container(
                                height: 200,
                                padding: const EdgeInsets.only(left: 30.0, right:30.0),
                                child: FlareActor(
                                  "assets/Teddy.flr",
                                  shouldClip: false,
                                  alignment: Alignment.bottomCenter,
                                  fit: BoxFit.contain,
                                  controller: _teddyController,
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                                  child: Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Username",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.blueAccent),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TrackingTextInput(
                                            onCaretMoved: (Offset caret) {
                                              _teddyController.lookAt(caret);
                                            },
                                            onTextChanged: (String val) {
                                              _teddyController.setUsername(val);
                                              _emailController = val;
                                            },
                                          ),
                                          Text("Password",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.blueAccent),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TrackingTextInput(
                                            isObscured: true,
                                            onCaretMoved: (Offset caret) {
                                              _teddyController.coverEyes(caret != null);
                                              _teddyController.lookAt(null);
                                            },
                                            onTextChanged: (String val) {
                                              _teddyController.setPassword(val);
                                              _passwordController = val;
                                            },
                                          ),
                                          SigninButton(
                                              child: Text("Login",
                                                  style: TextStyle(
                                                      fontFamily: "RobotoMedium",
                                                      fontSize: 16,
                                                      color: Colors.white)),
                                              onPressed: () {
                                                if (_formKey.currentState.validate()) {
                                                  if(_emailController.contains("@gmail.com")){
                                                  }
                                                  else{
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            title: Text("NOT AUTHORISED"),
                                                            content: Text("You are not authorised to login through student page!!!"),
                                                            actions: [
                                                              FlatButton(
                                                                child: Text("Ok"),
                                                                onPressed: () {
                                                                  Navigator.of(context).pop();
                                                                  setState(() {
                                                                    res = 0;
                                                                    _teddyController.setres(res);
                                                                    _teddyController.submitPassword();
                                                                  });
                                                                },
                                                              )
                                                            ],
                                                          );
                                                        });
                                                  }
                                                }
                                              }),
                                          _Fpass()
                                        ],
                                      )),
                                )),
                            SizedBox(height: 20,),
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}