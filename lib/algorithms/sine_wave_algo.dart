import 'package:flutter/material.dart';

import 'abstract_dotlago.dart';
import 'dart:math' as math;

class SineWaveAlgorithm extends DotAlgorithm {
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
      final progress = i / count;
      final x = (progress * 2 - 1);  // X goes from -1 to 1
      final y = 0.5 * math.sin(time + i * tau / count);  // Y is based on a sine wave

      dots.add({
        'alignment': Alignment(x, y),
        'lit': true,
      });
    }

    return dots;
  }
}
