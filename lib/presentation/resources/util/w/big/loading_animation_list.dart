import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimationList {
  static const double _size = 150;
  static const Color _clr = Colors.grey;

  static List<Widget> listLoading({size = _size, clr = _clr}) => [
        LoadingAnimationWidget.staggeredDotsWave(
          color: clr,
          size: size,
        ),
        LoadingAnimationWidget.inkDrop(color: clr, size: size),
        LoadingAnimationWidget.twistingDots(
          leftDotColor: const Color(0xFF1A1A3F),
          rightDotColor: const Color(0xFFEA3799),
          size: size,
        ),
        LoadingAnimationWidget.flickr(
            leftDotColor: const Color(0xFF1A1A3F),
            rightDotColor: const Color(0xFFEA3799),
            size: size),
        LoadingAnimationWidget.threeRotatingDots(color: clr, size: size),
        LoadingAnimationWidget.waveDots(color: clr, size: size),
        LoadingAnimationWidget.fourRotatingDots(color: clr, size: size),
        LoadingAnimationWidget.fallingDot(color: clr, size: size),
        LoadingAnimationWidget.prograssiveDots(color: clr, size: size),
        LoadingAnimationWidget.discreteCircle(color: clr, size: size),
        LoadingAnimationWidget.threeArchedCircle(color: clr, size: size),
        LoadingAnimationWidget.bouncingBall(color: clr, size: size),
        LoadingAnimationWidget.hexagonDots(color: clr, size: size),
        LoadingAnimationWidget.beat(color: clr, size: size),
        LoadingAnimationWidget.twoRotatingArc(color: clr, size: size),
        LoadingAnimationWidget.horizontalRotatingDots(color: clr, size: size),
        LoadingAnimationWidget.newtonCradle(color: clr, size: size),
        LoadingAnimationWidget.stretchedDots(color: clr, size: size),
        LoadingAnimationWidget.halfTriangleDot(color: clr, size: size),
        LoadingAnimationWidget.dotsTriangle(color: clr, size: size),
      ];

  static Widget randomLoading(
      {int? index, double? size, Color? clr, bool randomClr = true}) {
    int max = listLoading().length - 1;
    index = index != null
        ? index > max
            ? max
            : index
        : Random().nextInt(max);
    Color rClr = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return listLoading(
        size: size ?? _size, clr: clr ?? (randomClr ? rClr : _clr))[index];
  }
}
