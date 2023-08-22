import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class OnBoardin2 extends StatelessWidget {
  const OnBoardin2();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      lottie:
      'assets/on_boarding/onBoarding1.json',
      title: 'Communicate Seamlessly with Q-Tap',
      text: 'Effortlessly bridge the gap with NFC technology. Unlock the power of instant data exchange and seamless communication. Discover the ease of NFC for sharing, accessing, and communicating in a single touch. Embrace the future of contactless interactions now!"',
    );
  }
}
