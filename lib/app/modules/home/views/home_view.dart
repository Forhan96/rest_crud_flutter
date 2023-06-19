import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_crud_flutter/app/routes/app_pages.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';
import 'package:rest_crud_flutter/app/widgets/setting_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _infoCard(icon: Icons.person_outline, value: controller.name.value),
                  _infoCard(icon: Icons.phone_android, value: controller.phone.value),
                  _infoCard(icon: Icons.email_outlined, value: controller.email.value),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            SettingCard(
              onTap: () async {
                bool update = await Get.toNamed(Routes.UPDATE);
                if (update) {
                  controller.getUser();
                }
              },
              title: "Update Information",
            ),
            SettingCard(
              onTap: () {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              },
              title: "Change Password",
            ),
            SettingCard(
              onTap: () {
                controller.deleteAccount();
              },
              title: "Delete Account",
            ),
            SettingCard(
              onTap: () {
                controller.logOut();
              },
              title: "Logout",
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({required IconData icon, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            value,
            style: GoogleFonts.alexandria(
              color: AppColors.seconderyColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
