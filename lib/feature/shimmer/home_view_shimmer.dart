import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class HomeViewShimmer extends StatelessWidget {
  final double width;
  final double height;
  const HomeViewShimmer({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context)=>Shimmer.fromColors( baseColor: Colors.red,
    highlightColor: Colors.grey[300]!,
    child: Container(),


  );


}
