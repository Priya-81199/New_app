import 'package:ChatterFly/screens/login_screen.dart';
import 'package:ChatterFly/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ChatterFly/Components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey , end: Colors.white).animate(controller);

    controller.forward();

    controller.addListener((){
      setState(() {});
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: animation.value,
      body:  Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg.jpg"),
                fit: BoxFit.cover,
              ),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset('images/butterfly.gif'),
                          height: 100.0,
                        ),
                      ),
                      Flexible(
                        child: TypewriterAnimatedTextKit(
                          text : ['ChatterFly'],
                          textStyle: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                            ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  RoundedButton(title: 'Log in',colour: Colors.lightGreen,tag: 'login', onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },),
                  RoundedButton(title: 'Register',colour: Colors.green, tag : 'register',onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },),
                ],
              ),
            ),

        ),
      
    );
  }
}

