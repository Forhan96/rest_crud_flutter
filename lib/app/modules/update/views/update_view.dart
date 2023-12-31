import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';
import 'package:rest_crud_flutter/app/utils/input_validator.dart';
import 'package:rest_crud_flutter/app/widgets/text_input.dart';
import 'package:rest_crud_flutter/app/widgets/phone_input.dart';

import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> with InputValidationMixin {
  const UpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController countryCodeController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Information'),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: GetBuilder<UpdateController>(
          builder: (updateController) {
            nameController.text = updateController.name;
            countryCodeController.text = updateController.countryCode;
            phoneController.text = updateController.phone;
            emailController.text = updateController.email;
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 40.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextInput(
                        controller: nameController,
                        hintText: "Full Name",
                        validator: (name) {
                          if (isNotEmpty(name ?? "")) {
                            return null;
                          } else {
                            return 'Enter a valid name';
                          }
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      PhoneInput(
                        controller: phoneController,
                        onChanged: (phone) {
                          countryCodeController.text = phone.countryCode;
                          phoneController.text = phone.number;
                        },
                        validator: (name) {
                          if (isNotEmpty(name ?? "")) {
                            return null;
                          } else {
                            return 'Enter a valid phone';
                          }
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
                        height: 30.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          Map<String, String> body = {
                            "name": nameController.text,
                            "email": emailController.text,
                            "phone": phoneController.text,
                            "country_code": countryCodeController.text,
                          };
                          controller.updateUser(body);
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
            );
          },
        ));
  }
}
