import 'package:flutter/material.dart';

import 'abstract_dotlago.dart';
import 'dart:math' as math;

class LissajousCurveAlgorithm extends DotAlgorithm {
  static const tau = math.pi * 2;

  @override
  List<Map<String, dynamic>> generateDots(int count) {
    return _generateDots(count, 0.0);
  }

  @override
  List<Map<String, dynamic>> animateDots(int count, double time) {
    return _generateDots(count, time);
  }

  List<Map<String, dynamic>> _generateDots(int count, double time) {
    final dots = <Map<String, dynamic>>[];

    // Parameters for Lissajous curve
    const double a = 3;  // Frequency on x-axis
    const double b = 2;  // Frequency on y-axis
    const double delta = math.pi / 2;  // Phase shift

    for (var i = 0; i < count; i++) {
      final t = i / count * tau * 2;  // Normalize time over 0 to 2*PI

      // X and Y positions based on the Lissajous curve equation
      final x = math.sin(a * t + delta);  // Varies over -1 to 1
      final y = math.sin(b * t + time);  // Varies over -1 to 1 with time shift

      dots.add({
        'alignment': Alignment(x, y),
        'lit': true,
      });
    }

    return dots;
  }
}
