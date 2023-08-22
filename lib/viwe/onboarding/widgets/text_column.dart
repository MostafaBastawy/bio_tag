import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/onboarding_constat.dart';


class TextColumn extends StatelessWidget {
  final String title;
  final String text;
  final String lottie;

  const TextColumn({
    required this.lottie,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: <Widget>[
        Lottie.asset(
          lottie,
          fit: BoxFit.cover,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: kBlack, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: kSpaceS),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: kBlack),
        ),
      ],
    );
  }
}
