import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:dotlago/algorithms/abstract_dotlago.dart';
import 'package:dotlago/algorithms/magnetic_field_algo.dart';
import 'package:dotlago/objects/dot.dart';

class AlgorithmWidget extends StatefulWidget {
  final DotAlgorithm algorithm;
  final int dotCount;

  const AlgorithmWidget({
    required this.algorithm,
    required this.dotCount,
    Key? key,
  }) : super(key: key);

  @override
  _AlgorithmWidgetState createState() => _AlgorithmWidgetState();
}

class _AlgorithmWidgetState extends State<AlgorithmWidget> with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _time = 0.0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((Duration elapsed) {
      setState(() {
        _time = elapsed.inMilliseconds / 1000.0;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dotConfigs = widget.algorithm.animateDots(widget.dotCount, _time);

    return GestureDetector(
      onPanUpdate: (details) {
        // Update the magnetic center based on touch position
        final newCenter = Alignment(
          (details.localPosition.dx / MediaQuery.of(context).size.width) * 2 - 1,
          (details.localPosition.dy / MediaQuery.of(context).size.height) * 2 - 1,
        );
        if (widget.algorithm is MagneticFieldAlgorithm) {
          (widget.algorithm as MagneticFieldAlgorithm).updateMagneticCenter(newCenter);
        }
      },
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          height: 600,
          width: 600,
          child: Stack(
            children: dotConfigs.map((config) {
              final alignment = config['alignment'] as Alignment;
              final lit = config['lit'] as bool;

              return AnimatedAlign(
                alignment: alignment,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Dot(lit),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
