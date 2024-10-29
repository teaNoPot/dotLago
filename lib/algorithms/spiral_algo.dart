import 'package:flutter/material.dart';

import 'abstract_dotlago.dart';
import 'dart:math' as math;

class SpiralAlgorithm extends DotAlgorithm {
  static const tau = math.pi * 2;
  static const scaleFactor = 0.8;
  static final phi = (math.sqrt(5) + 1) / 2;

  @override
  List<Map<String, dynamic>> generateDots(int count) {
    return _generateDots(count, 0.0);  // Generate the initial positions with no time offset
  }

  @override
  List<Map<String, dynamic>> animateDots(int count, double time) {
    return _generateDots(count, time);  // Animate the dots with the time offset
  }

  // Helper method to generate dots, with time affecting the animation
  List<Map<String, dynamic>> _generateDots(int count, double time) {
    final dots = <Map<String, dynamic>>[];
    int maxCount = 250;

    for (var i = 0; i < maxCount; i++) {
      final baseTheta = i * tau / phi;  // Base angle for the spiral
      final r = math.sqrt(i) * scaleFactor;  // Fixed radial distance
      final rotatedTheta = baseTheta + time;  // Apply time as a rotation to the angle

      if (i < count) {
        dots.add({
          'alignment': Alignment(r * math.cos(rotatedTheta), -1 * r * math.sin(rotatedTheta)),
          'lit': true,
        });
      } else {
        dots.add({
          'alignment': Alignment(r * math.cos(rotatedTheta), -1 * r * math.sin(rotatedTheta)),
          'lit': false,
        });
      }
    }

    return dots;
  }
}
