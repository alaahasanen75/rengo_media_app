import 'package:calender/core/theming/colors.dart';
import 'package:calender/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TheRatio extends StatelessWidget {
  const TheRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          child: CustomPaint(
            child: Center(
              child: Text(
                '56 %',
                style: TextStyles.font16whitbold,
              ),
            ),
            painter: BlackContainer(),
          ),
          height: 50.h,
          width: 60.w,
        ),
      ),
    );
  }
}

class BlackContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    Paint paint = Paint()..color = ColorsManager.black;
    path.moveTo(0, 0);
    path.lineTo(0, size.height * .9);
    path.lineTo(size.width * .4, size.height * .9);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2 + .5 * 18, size.height * .9);
    path.lineTo(size.width, size.height * .9);
    path.lineTo(
      size.width,
      0,
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
