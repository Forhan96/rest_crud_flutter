import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';
import 'package:rest_crud_flutter/app/utils/image_const.dart';
import 'package:rest_crud_flutter/app/utils/input_validator.dart';
import 'package:rest_crud_flutter/app/widgets/TextInput.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> with InputValidationMixin {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    ImageAssets.logo,
                    height: 120.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Login',
                    style: GoogleFonts.alexandria(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextInput(
                      controller: emailController,
                      hintText: "Email Address",
                      validator: (email) {
                        if (isEmailValid(email ?? "")) {
                          return null;
                        } else {
                          return 'Enter a valid email';
                        }
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    TextInput(
                      controller: passwordController,
                      hintText: "Password",
                      validator: (password) {
                        if (isPasswordValid(password ?? "")) {
                          return null;
                        } else {
                          return 'Use uppercase, lowecase, digits & special characters';
                        }
                      },
                      obscure: true,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        Get.offNamedUntil(Routes.HOME, (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        minimumSize: Size.fromHeight(40.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: GoogleFonts.alexandria(
                          // color: AppColors.primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Don't have an account?  ",
                      style: GoogleFonts.alexandria(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offAndToNamed(Routes.REGISTER);
                        },
                      text: "Register",
                      style: GoogleFonts.alexandria(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
