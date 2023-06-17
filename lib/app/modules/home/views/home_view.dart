import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';

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
            _infoCard(icon: Icons.person_outline, value: "Name"),
            _infoCard(icon: Icons.phone_android, value: "+8801688035441"),
            _infoCard(icon: Icons.email_outlined, value: "f.a.chowdhury@hotmail.com"),
            SizedBox(
              height: 12.h,
            ),
            SettingCard(
              onTap: () {},
              title: "Update Information",
            ),
            SettingCard(
              onTap: () {},
              title: "Update Information",
            ),
            SettingCard(
              onTap: () {},
              title: "Update Information",
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

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    this.onTap,
    required this.title,
  });
  final Function? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.seconderyColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(0, 15),
              ),
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.alexandria(
                color: AppColors.seconderyColor,
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
