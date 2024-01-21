import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBloc extends StatelessWidget {
  const ShimmerBloc({Key? key, required this.size, required this.radius, this.baseColor, this.highlightColor})
      : super(key: key);

  final Size size;
  final double radius;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.withOpacity(0.2),
      highlightColor: highlightColor ?? Colors.grey.withOpacity(0.4),
      enabled: true,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
