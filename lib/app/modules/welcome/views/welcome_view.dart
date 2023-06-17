import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';
import 'package:rest_crud_flutter/app/utils/image_const.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    ImageAssets.logo,
                    height: 150.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Welcome to the app',
                    style: GoogleFonts.alexandria(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      fixedSize: Size(200.w, 40.h),
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.alexandria(
                        // color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                      fixedSize: Size(200.w, 40.h),
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
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Designed & Developed by  ",
                      style: GoogleFonts.alexandria(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    TextSpan(
                      text: "Forhan",
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
