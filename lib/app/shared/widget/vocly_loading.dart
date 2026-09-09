import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';

class VoclyLoading extends StatelessWidget {
  const VoclyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(size: 20, color: UiColor.thirdColor);
  }
}
