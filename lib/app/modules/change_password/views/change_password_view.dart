import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';
import 'package:rest_crud_flutter/app/utils/input_validator.dart';
import 'package:rest_crud_flutter/app/widgets/text_input.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> with InputValidationMixin {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 40.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextInput(
                    controller: currentPasswordController,
                    hintText: "Current Password",
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
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      Map<String, String> body = {
                        "current_password": currentPasswordController.text,
                        "password": passwordController.text,
                        "password_confirm": confirmPasswordController.text,
                      };
                      controller.changePassword(body);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: Size.fromHeight(40.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Save",
                      style: GoogleFonts.alexandria(
                        // color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
