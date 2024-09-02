import 'package:calender/core/theming/colors.dart';
import 'package:calender/core/theming/styles.dart';
import 'package:calender/presentation/screens/LayOut/screen/lay_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBottomWidget extends StatelessWidget {
  LoginBottomWidget({super.key, required this.enterEmailAndPassword});
  bool enterEmailAndPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forgot Password ?',
          style: TextStyles.font14BlackSemiBold,
        ),
        SizedBox(
          height: 24.h,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(8.r),
          onTap: () => enterEmailAndPassword
              ? Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => LayOytScreen())),
                )
              : null,
          child: Container(
            height: 56.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: enterEmailAndPassword
                    ? ColorsManager.black
                    : ColorsManager.moreLightGray),
            child: Center(
              child: Text(
                'Login',
                style: TextStyles.font16whitbold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Center(
          child: Text(
            'Or login with account',
            style: TextStyles.font12darkGraysemiBold,
          ),
        ),
      ],
    );
  }
}
