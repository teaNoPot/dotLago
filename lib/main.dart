import 'package:dotlago/widgets/algorithm.dart';
import 'package:flutter/material.dart';

import 'algorithms/abstract_dotlago.dart';
import 'algorithms/circular_orbit_algo.dart';
import 'algorithms/grid_algo.dart';
import 'algorithms/lissajous_curve_algo.dart';
import 'algorithms/magnetic_field_algo.dart';
import 'algorithms/random_pulse_algo.dart';
import 'algorithms/sine_wave_algo.dart';
import 'algorithms/spiral_algo.dart';

void main() {
  runApp(const VisualizerApp());
}

class VisualizerApp extends StatefulWidget {
  const VisualizerApp({super.key});

  @override
  State<VisualizerApp> createState() => _VisualizerAppState();
}

class _VisualizerAppState extends State<VisualizerApp> {
  DotAlgorithm selectedAlgorithm = GridAlgorithm();
  final List<DotAlgorithm> algorithms = [
    GridAlgorithm(),
    SpiralAlgorithm(),
    RandomPulseAlgorithm(),
    MagneticFieldAlgorithm(),
    SineWaveAlgorithm(),
    CircularOrbitAlgorithm(),
    LissajousCurveAlgorithm(),
    /*
    // TODO
    RandomScatterAlgorithm(),
    CircleAlgorithm(),
    SpiralGalaxyAlgorithm(),
    HeartShapeAlgorithm(),
    HypotrochoidAlgorithm(),
     */
  ];

  int dotCount = 120;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(title: const Text("DotLago")),
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<DotAlgorithm>(
                  value: selectedAlgorithm,
                  items: algorithms.map((DotAlgorithm algo) {
                    return DropdownMenuItem<DotAlgorithm>(
                      value: algo,
                      child: Text(algo.runtimeType.toString()),
                    );
                  }).toList(),
                  onChanged: (DotAlgorithm? newAlgorithm) {
                    if (newAlgorithm != null) {
                      setState(() {
                        selectedAlgorithm = newAlgorithm;
                      });
                    }
                  },
                ),
                /*
                Slider(
                  min: 1,
                  max: 250,
                  value: dotCount.toDouble(),
                  onChanged: (value) => setState(() => dotCount = value.round()),
                ),
                 */
              ],
            ),
            Expanded(
              child: AlgorithmWidget(
                algorithm: selectedAlgorithm,
                dotCount: dotCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


