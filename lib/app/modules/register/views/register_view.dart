import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rest_crud_flutter/app/utils/input_validator.dart';
import 'package:rest_crud_flutter/app/widgets/phone_input.dart';

import '../controllers/register_controller.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';
import 'package:rest_crud_flutter/app/utils/image_const.dart';
import 'package:rest_crud_flutter/app/widgets/text_input.dart';

class RegisterView extends GetView<RegisterController> with InputValidationMixin {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController countryCodeController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          shrinkWrap: true,

          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 56.h,
            ),
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
                  'Register',
                  style: GoogleFonts.alexandria(
                    color: AppColors.primaryColor,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextInput(
                    controller: nameController,
                    hintText: "Full Name",
                    validator: (name) {
                      if (isValidName(name ?? "")) {
                        return null;
                      } else {
                        return 'Enter a valid email';
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  PhoneInput(
                    onChanged: (phone) {
                      countryCodeController.text = phone.countryCode;
                      phoneController.text = phone.number;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
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
                      if (isNotEmpty(password ?? "")) {
                        return null;
                      } else {
                        return 'Use uppercase, lowecase, digits & special characters';
                      }
                    },
                    obscure: true,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextInput(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    validator: (password) {
                      if (isNotEmpty(password ?? "")) {
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
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      Map<String, String> body = {
                        "name": nameController.text,
                        "email": emailController.text,
                        "phone": phoneController.text,
                        "country_code": countryCodeController.text,
                        "password": passwordController.text,
                        "password_confirm": confirmPasswordController.text,
                      };
                      await controller.signUp(body);
                      // Get.offNamedUntil(Routes.HOME, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: Size.fromHeight(40.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Register",
                      style: GoogleFonts.alexandria(
                        // color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            RichText(
              textAlign: TextAlign.center,
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
                        Get.offAndToNamed(Routes.LOGIN);
                      },
                    text: "Login",
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
    );
  }
}
