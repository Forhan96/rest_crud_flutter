import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hintText,
    this.validator,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? initialValue;

  final String? label;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(PhoneNumber)? onChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).canvasColor,
        alignLabelWithHint: true,
        isDense: true,
        errorStyle: TextStyle(
          color: AppColors.errorColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppColors.seconderyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        border: InputBorder.none,
        errorMaxLines: 2,
        counterText: "",
      ),
      initialCountryCode: 'BD',
      initialValue: initialValue,
      onChanged: (phone) {
        onChanged?.call(phone);
        // controller?.text = phone.completeNumber;
      },
    );
  }
}
