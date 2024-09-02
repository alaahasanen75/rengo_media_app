import 'package:calender/core/constants.dart';
import 'package:calender/presentation/screens/login/widgets/container_of_continu.dart';
import 'package:calender/presentation/screens/login/widgets/do_not_have_account_text_.dart';
import 'package:calender/presentation/screens/login/widgets/login_bottom.dart';
import 'package:calender/presentation/screens/login/widgets/login_form_field_widget.dart';
import 'package:calender/presentation/screens/login/widgets/login_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              const LoginTextWidget(),
              SizedBox(
                height: 40.h,
              ),
              LoginFormFieldWidget(),
              SizedBox(
                height: 24.h,
              ),
              LoginBottomWidget(
                enterEmailAndPassword: enterEmailAndPassword,
              ),
              SizedBox(
                height: 24.h,
              ),
              SocialMediaAccount(
                img: 'assets/images/Google.svg',
                text: 'Continue with Google',
              ),
              SizedBox(
                height: 16.h,
              ),
              SocialMediaAccount(
                img: 'assets/images/Facebook.svg',
                text: 'Continue with Facebook',
              ),
              SizedBox(
                height: 16.h,
              ),
              SocialMediaAccount(
                img: 'assets/images/Apple.svg',
                text: 'Continue with Apple',
              ),
              SizedBox(
                height: 40.h,
              ),
              const DoNotHaveAccountText()
            ],
          ),
        ),
      ),
    );
  }
}
