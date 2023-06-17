import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';

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
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
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
