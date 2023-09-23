import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    return isLogin;
  }

  void moveScreen() async {
    await checkLogin().then((isLogin) =>
    {
      // todo: splash test 후 주석처리
      // if (isLogin){Navigator.of(context).pushReplacementNamed('/index')}
      // else {Navigator.of(context).pushReplacementNamed('/login')}
      Navigator.of(context).pushReplacementNamed('/index')
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(microseconds: 4000), () {
      moveScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
