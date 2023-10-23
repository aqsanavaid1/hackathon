
import 'package:flutter/material.dart';
import 'package:mid/first.dart';
// import 'package:mid/login_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () { 
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  first()),
      );
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent, 
      body: Center(
        child: Image.asset('assets/splash.png'),  
      ),
    );
  }
}