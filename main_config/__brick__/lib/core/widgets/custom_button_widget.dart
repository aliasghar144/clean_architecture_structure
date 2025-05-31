import 'package:flutter/material.dart';


class CustomButtonWidget extends StatelessWidget {

  const CustomButtonWidget(
      {this.borderWidth,
      this.disableBackground,
      this.loading = false,
      this.width = double.infinity,
      this.height = 60,
      super.key,
      this.borderColor,
      this.backGroundColor,
      this.gradientOff,
      this.onTap,
      this.child});
  final Function? onTap;
  final bool loading;
  final double? width;
  final double? height;
  final Widget? child;
  final Color? backGroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool? disableBackground;
  final bool? gradientOff;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        foregroundColor: WidgetStateProperty.all<Color>(backGroundColor ?? const Color(0xffffffff)),
        backgroundColor: WidgetStateProperty.all<Color>(backGroundColor ?? AppColors.primaryL),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
                color: borderColor ?? AppColors.primaryL,
                strokeAlign: BorderSide.strokeAlignOutside,
                width: borderWidth ?? 1),
          ),
        ),
      ),
      onPressed: () async {
        onTap?.call();
      },
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backGroundColor ?? AppColors.primaryL,
            borderRadius: BorderRadius.circular(12), // Match button shape
          ),
          child: loading ? const Center(child: CircularProgressIndicator(color: Colors.white,)) : Center(child: child)),
    );
  }
}
