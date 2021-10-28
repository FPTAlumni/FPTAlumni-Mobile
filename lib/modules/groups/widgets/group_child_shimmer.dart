import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GroupChildShimmer extends StatelessWidget {
  const GroupChildShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            margin: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.grey,
            ),
          ),
          Container(
            width: 90,
            height: 90,
            margin: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
