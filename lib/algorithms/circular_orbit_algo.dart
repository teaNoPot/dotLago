import 'package:flutter/material.dart';

import 'abstract_dotlago.dart';
import 'dart:math' as math;

class CircularOrbitAlgorithm extends DotAlgorithm {
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

    for (var i = 0; i < count; i++) {
      final angle = i * tau / count;  // Spread the dots evenly across the circle
      final radius = 0.5 + (i % 10) * 0.05;  // Vary the radius slightly for each dot
      final orbitSpeed = 0.2 + i * 0.01;  // Vary the speed of orbit

      // Calculate the position of the dot based on the orbit
      final x = radius * math.cos(time * orbitSpeed + angle);
      final y = radius * math.sin(time * orbitSpeed + angle);

      dots.add({
        'alignment': Alignment(x, y),
        'lit': true,
      });
    }

    return dots;
  }
}
