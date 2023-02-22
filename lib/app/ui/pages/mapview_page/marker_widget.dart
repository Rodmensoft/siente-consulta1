import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkerToWidget extends StatelessWidget {
  const MarkerToWidget({
    Key? key,
    required this.image,
    required this.color,
  }) : super(key: key);

  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          Container(
            height: 115.sp,
            width: 115.sp,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image(
                image: AssetImage(image),
                height: 60.sp,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
