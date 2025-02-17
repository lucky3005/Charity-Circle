import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/lottie/loading progress.json"),
    );
  }
}
