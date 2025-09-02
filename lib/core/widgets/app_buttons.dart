import 'package:flutter/material.dart';
import 'package:guruh5/core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double height;
  final double radius;
  final VoidCallback onPressed;
  const PrimaryButton({
    super.key,
    required this.title,
    this.height = 48.0,
    this.radius = 48.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
