import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtap/core/constant/onboarding_constat.dart';
import 'package:qtap/viwe/Authentication/signup.dart';
import 'package:qtap/viwe/drawe/landing.dart';
import 'package:qtap/viwe/onboarding/pages/page1/page1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  Widget currentPage = OnBoardin1();

  @override
  void initState() {
    checkLogin();
    Timer(Duration(seconds: 5), () => Get.offAll(() => currentPage));
    super.initState();
  }

  checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? logged = pref.getBool("loggedIn");
    bool? onSeen = pref.getBool("onSeen");
    print("logged $logged");
    if (logged != null) {
      setState(() {
        currentPage = LandingPage();
      });
    } else {
      if (onSeen != true) {
        setState(() {
          currentPage = Builder(
            builder: (BuildContext context) {
              final screenHeight = MediaQuery.of(context).size.height;

              return Onboarding(screenHeight: screenHeight);
            },
          );
        });
      } else {
        setState(() {
          currentPage = SignUp();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 276,
              height: 276,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "BIO TAG",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48.8,
                color: kBrandingColor,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
