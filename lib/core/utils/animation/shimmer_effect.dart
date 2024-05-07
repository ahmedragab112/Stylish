import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    required this.width,
    required this.child,
  });
  final double width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(.20),
          highlightColor: darkBackGroundColor,
          child: child,
          ),
    );
  }
}
const Color darkBackGroundColor = Color(0xff100B20);
