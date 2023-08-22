import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/onboarding_constat.dart';

class OnboardingPage extends StatelessWidget {
  final int number;
  // final Widget lightCardChild;
  // final Widget darkCardChild;
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;
  final Widget textColumn;

  const OnboardingPage({
    required this.number,
    // required this.lightCardChild,
    // required this.darkCardChild,
    required this.lightCardOffsetAnimation,
    required this.darkCardOffsetAnimation,
    required this.textColumn,
  });

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child:   Column(
        children: <Widget>[

        SizedBox(height: number % 2 == 1 ? 50.0 : 25.0),
    AnimatedSwitcher(
    duration: kCardAnimationDuration,
    child: textColumn,
    ),
    ],
        ),
    );


  }
  Widget _buildImage() {
    return Align(
      child: Column(
        children: [

          SizedBox(height: 40,),
        ],
      ),
      alignment: Alignment.center,
    );
  }

}
