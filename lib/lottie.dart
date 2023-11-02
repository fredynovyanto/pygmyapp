import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pygmyapp_menu/auth/login_view.dart';
import 'package:pygmyapp_menu/provider/auth_provider.dart';

import 'homebtn.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen ({ key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 400,
              height: 600,
              child: LottieBuilder.asset('asset/owl.json'),
            ),
            const Text(
              'Pygmy Owl Coffee',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Future<Timer> startTimer() async {
    return Timer(const Duration(seconds: 5), onDone);
  }

  Future onDone() {
    FirebaseAuth auth = FirebaseAuth.instance;
    AuthProvider();
    if(auth.currentUser == null) {
      return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginView()));
    } else {
      return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homebtn()));
    }
  }
}
