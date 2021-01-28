import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/controllers/controllers.dart';

class Wave extends StatelessWidget {
  Wave({Key key, this.running = false}) : super(key: key);
  final bool running;

  _buildCard({
    Config config,
    Color backgroundColor = Colors.transparent,
    DecorationImage backgroundImage,
  }) {
    return Expanded(
        child: Container(
      width: double.infinity,
      child: WaveWidget(
        isLoop: running,
        duration: 0,
        waveFrequency: running ? 2 : 0,
        config: config,
        backgroundColor: backgroundColor,
        backgroundImage: backgroundImage,
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildCard(
        config: CustomConfig(
      colors: [
        Color(0xFFD1F6FF),
        Color(0xFFCEF0FF),
        Color(0xFFD1F6FF),
        Color(0xFF8FDDFF),
      ],
      durations: [32000, 21000, 18000, 5000],
      heightPercentages: [0, 0, 0, 0],
      // heightPercentages: [0.25, 0.26, 0.28, 0.31],
    ));
  }
}
