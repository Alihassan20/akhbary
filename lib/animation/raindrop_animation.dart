import 'package:flutter/animation.dart';

class StaggeredRaindropAnimation {

  StaggeredRaindropAnimation(this.controller):
        dropSize = Tween<double>(begin: 0, end: maximumDropSize).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.2, curve: Curves.easeIn),
          ),
        ),
        dropPosition = Tween<double>(begin: 0, end: maximumRelativeDropY).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.5, curve: Curves.easeIn),
          ),
        ),
        holeSize = Tween<double>(begin: 0, end: maximumHoleSize).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
          ),
        ),
        dropVisible = Tween<bool>(begin: true, end: false).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.5),
          ),
        );
  final AnimationController controller;
  final Animation<double> dropSize;
  final Animation<double> dropPosition;
  final Animation<bool> dropVisible;
  final Animation<double> holeSize;
  static final double maximumDropSize = 20;
  static final double maximumRelativeDropY = 0.5;
  static final double maximumHoleSize = 10;
}