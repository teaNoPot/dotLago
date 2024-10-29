import 'package:flutter/material.dart';

import 'abstract_dotlago.dart';
import 'dart:math' as math;


class GridAlgorithm extends DotAlgorithm {
  static const int gridSize = 10;

  @override
  List<Map<String, dynamic>> generateDots(int count) {
    return _generateGrid(count, 0.0);  // No time offset for static dots
  }

  @override
  List<Map<String, dynamic>> animateDots(int count, double time) {
    return _generateGrid(count, time);  // Time offset for animated dots
  }

  List<Map<String, dynamic>> _generateGrid(int count, double time) {
    final dots = <Map<String, dynamic>>[];
    int gridCount = math.sqrt(count).floor();
    for (var x = 0; x < gridCount; x++) {
      for (var y = 0; y < gridCount; y++) {
        final posX = (x / gridCount) * 2 - 1; // Normalizing x position between -1 and 1
        final posY = (y / gridCount) * 2 - 1; // Normalizing y position between -1 and 1

        dots.add({
          'alignment': Alignment(posX, posY),
          'lit': true,
        });
      }
    }
    return dots;
  }
}
