import 'package:flutter/material.dart';

import 'abstract_dotlago.dart';
import 'dart:math' as math;


class MagneticFieldAlgorithm extends DotAlgorithm {
  Alignment magneticCenter = Alignment.center;

  @override
  List<Map<String, dynamic>> generateDots(int count) {
    return _generateDots(count, 0.0);
  }

  @override
  List<Map<String, dynamic>> animateDots(int count, double time) {
    return _generateDots(count, time);
  }

  void updateMagneticCenter(Alignment newCenter) {
    magneticCenter = newCenter;  // Update the center based on touch location
  }

  List<Map<String, dynamic>> _generateDots(int count, double time) {
    final dots = <Map<String, dynamic>>[];

    for (var i = 0; i < count; i++) {
      // Random initial positions
      final angle = 2 * math.pi * i / count;
      final r = 0.8;
      final baseX = r * math.cos(angle);
      final baseY = r * math.sin(angle);

      // Move towards magnetic center over time
      final moveTowardsX = baseX + (magneticCenter.x - baseX) * (0.5 * math.sin(time) + 0.5);
      final moveTowardsY = baseY + (magneticCenter.y - baseY) * (0.5 * math.sin(time) + 0.5);

      dots.add({
        'alignment': Alignment(moveTowardsX, moveTowardsY),
        'lit': true,
      });
    }

    return dots;
  }
}
