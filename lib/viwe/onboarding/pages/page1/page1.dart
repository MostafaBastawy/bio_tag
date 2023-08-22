import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/text_column.dart';

class OnBoardin1 extends StatelessWidget {
  const OnBoardin1();

  @override
  Widget build(BuildContext context) {
    return  TextColumn(
      lottie:
      "assets/on_boarding/onboarding2.json",
      title: 'Embrace the NFC Revolution and Enjoy',
      text:
          'Discover the magic of Seamless Connectivity with our innovative NFC-powered app. Simply download, tap, and Connect with a world of possibilities."',
    );
  }

}
