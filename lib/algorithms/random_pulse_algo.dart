import 'package:flutter/material.dart';

import 'abstract_dotlago.dart';
import 'dart:math' as math;


class RandomPulseAlgorithm extends DotAlgorithm {
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
    final random = math.Random();

    for (var i = 0; i < count; i++) {
      // Random x, y positions normalized between -1 and 1
      final posX = random.nextDouble() * 2 - 1;
      final posY = random.nextDouble() * 2 - 1;
      final pulse = (math.sin(time * 2 * math.pi + i) + 1) / 2;  // Pulsing effect based on time

      dots.add({
        'alignment': Alignment(posX, posY),
        'lit': true,
        'scale': 0.5 + pulse, // Scale between 0.5 and 1.5 for pulsing effect
      });
    }

    return dots;
  }
}
