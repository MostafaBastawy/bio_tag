import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class OnBoardin3 extends StatelessWidget {
  const OnBoardin3();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      lottie:
      'assets/on_boarding/onBoarding4.json',
      title: 'Unlock the Possibilities',
      text:
          ' Experience the magic of NFC technology. Share photos, files, and more effortlessly. Gain access to secure areas and events with a simple touch. Discover the freedom of seamless communication on-the-go',
    );
  }
}
