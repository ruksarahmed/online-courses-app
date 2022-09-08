import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/company.dart';

class CourceCard extends StatelessWidget {
  const CourceCard({
    Key? key,
    required this.cource,
  }) : super(key: key);

  final Cource cource;

  BoxDecoration _createShadowRoundCorners() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 2.0,
          blurRadius: 10.0,
        ),
      ],
    );
  }

  Widget _createThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: [
          Image.asset(cource.thumbnail),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: _createLinkButton(),
          ),
        ],
      ),
    );
  }

  Widget _createLinkButton() {
    return Material(
      color: Colors.white24,
      type: MaterialType.circle,
      child: IconButton(
        icon: const Icon(Icons.link),
        onPressed: () async {
          if (await canLaunch(cource.url)) {
            await launch(cource.url);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: _createShadowRoundCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: _createThumbnail(),
          ),
          Flexible(
            flex: 2,
            child: createCourceInfo(),
          ),
        ],
      ),
    );
  }

  Widget createCourceInfo() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 4.0,
        right: 4.0,
      ),
      child: Text(
        cource.title,
        style: TextStyle(
          color: Colors.white.withOpacity(0.85),
        ),
      ),
    );
  }
}
