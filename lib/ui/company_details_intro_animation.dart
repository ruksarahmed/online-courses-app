import 'package:flutter/material.dart';

class CompanyDetailsIntroAnimation {
  CompanyDetailsIntroAnimation(this.controller)
      : bgDropOpacity = Tween(
          begin: 0.5,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.000,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        bgDropBlur = Tween(
          begin: 0.0,
          end: 5.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.000,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        avatarSize = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.100,
              0.400,
              curve: Curves.elasticInOut,
            ),
          ),
        ),
        nameOpacity = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.350,
              0.450,
              curve: Curves.easeIn,
            ),
          ),
        ),
        locationOpacity = Tween(
          begin: 0.0,
          end: 0.85,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.500,
              0.600,
              curve: Curves.easeIn,
            ),
          ),
        ),
        deviderWidth = Tween(
          begin: 0.0,
          end: 225.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.650,
              0.75,
              curve: Curves.elasticInOut,
            ),
          ),
        ),
        aboutOpacity = Tween(
          begin: 0.0,
          end: 0.85,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.750,
              0.900,
              curve: Curves.easeIn,
            ),
          ),
        ),
        courceScrollerXTranslation = Tween(
          begin: 60.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.830,
              1.000,
              curve: Curves.ease,
            ),
          ),
        ),
        courceScrollerOpacity = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.830,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );

  late final AnimationController controller;
  late Animation<double> bgDropOpacity;
  late Animation<double> bgDropBlur;
  late Animation<double> avatarSize;
  late Animation<double> nameOpacity;
  late Animation<double> locationOpacity;
  late Animation<double> deviderWidth;
  late Animation<double> aboutOpacity;
  late Animation<double> courceScrollerXTranslation;
  late Animation<double> courceScrollerOpacity;
}
