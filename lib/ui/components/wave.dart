import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Wave extends StatefulWidget {
  Wave({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> {
  _buildCard({
    Config config,
    Color backgroundColor = Colors.transparent,
    DecorationImage backgroundImage,
  }) {
    return Expanded(
        child: Container(
      width: double.infinity,
      child: WaveWidget(
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
      heightPercentages: [0.25, 0.26, 0.28, 0.31],
    ));
  }
}
