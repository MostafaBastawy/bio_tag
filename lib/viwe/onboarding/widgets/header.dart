import 'package:flutter/material.dart';

import '../../../core/constant/onboarding_constat.dart';
import '../../../core/widget_reuseable/logo.dart';



class Header extends StatelessWidget {
  final VoidCallback onSkip;

  const Header({
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Logo(
          color: kWhite,
          size: 35.0,
        ),
        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: kBlack,
              fontSize: 22,
              fontWeight: FontWeight.w500
                ),
          ),
        ),
      ],
    );
  }
}
