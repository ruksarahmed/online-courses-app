import 'package:company_profile/model/company.dart';
import 'package:company_profile/ui/company_details_intro_animation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'cource_card.dart';

class CompanyDetailsPage extends StatelessWidget {
  CompanyDetailsPage({
    Key? key,
    required this.company,
    required AnimationController controller,
  })  : animation = CompanyDetailsIntroAnimation(controller),
        super(key: key);

  final Company company;
  final CompanyDetailsIntroAnimation animation;

  Widget _createAnimation(BuildContext context, Widget? child) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: animation.bgDropOpacity.value,
          child: Image.asset(
            company.backDropPhoto,
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: animation.bgDropBlur.value,
            sigmaY: animation.bgDropBlur.value,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: _createAnimation,
      ),
    );
  }

  Widget _createContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createLogoAvatar(),
          _createAboutCompany(),
          _createCourceScroller(),
        ],
      ),
    );
  }

  Widget _createLogoAvatar() {
    return Transform(
      transform: Matrix4.diagonal3Values(
          animation.avatarSize.value, animation.avatarSize.value, 1.0),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 110.0,
        margin: const EdgeInsets.only(
          top: 32.0,
          left: 19.0,
        ),
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                company.logo,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Build Apps with Ruksar",
                style: TextStyle(
                  fontSize: 19 * animation.avatarSize.value + 2.0,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAboutCompany() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 14.0,
        left: 14.0,
        right: 14.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company.name,
            style: TextStyle(
              color: Colors.white.withOpacity(animation.nameOpacity.value),
              fontSize: 30.0 * animation.avatarSize.value + 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            company.location,
            style: TextStyle(
              color: Colors.white.withOpacity(animation.locationOpacity.value),
              fontWeight: FontWeight.w500,
            ),
          ),
          // Divider
          Container(
            color: Colors.white.withOpacity(0.79),
            margin: const EdgeInsets.symmetric(vertical: 14.0),
            width: animation.deviderWidth.value,
            height: 1.0,
          ),
          Text(
            company.about,
            style: TextStyle(
              color: Colors.white.withOpacity(animation.aboutOpacity.value),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createCourceScroller() {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Transform(
        transform: Matrix4.translationValues(
            animation.courceScrollerXTranslation.value, 0.0, 0.0),
        child: SizedBox.fromSize(
          size: const Size.fromHeight(250.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            itemCount: company.cources.length,
            itemBuilder: (BuildContext context, int index) {
              var cource = company.cources[index];
              return CourceCard(cource: cource);
            },
          ),
        ),
      ),
    );
  }
}
