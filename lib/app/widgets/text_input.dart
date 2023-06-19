import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_crud_flutter/app/utils/color_const.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.enabled = true,
    this.obscure = false,
    this.focusNode,
    this.characterLength,
    this.prefix,
    this.hintText,
    this.validator,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? label;
  final String? hintText;
  final bool enabled;
  final bool obscure;
  final FocusNode? focusNode;
  final int? characterLength;
  final Widget? prefix;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
      // minLines: widget.maxLine ?? 1,
      // maxLines: widget.maxLine ?? 6,
      obscureText: obscure,
      decoration: InputDecoration(
        enabled: enabled,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: GoogleFonts.alexandria(
          color: AppColors.seconderyColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelText: label,
        hintText: hintText,
        hintStyle: GoogleFonts.alexandria(
          color: AppColors.seconderyColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 18.w),
        errorStyle: const TextStyle(
          color: AppColors.errorColor,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.seconderyColor,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.seconderyColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        prefixIcon: prefix,
        prefixIconColor: AppColors.primaryColor,
      ),
    );
  }
}
