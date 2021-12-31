import 'package:english_day/value/app_colors.dart';
import 'package:english_day/value/app_style.dart';
import 'package:flutter/material.dart';

class AppButon extends StatelessWidget {
  final String label;
  final VoidCallback Ontap;

  const AppButon({Key? key, required this.label, required this.Ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Ontap();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(3, 6))],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          label,
          style: AppStyle.h5.copyWith(color: AppColors.textColor),
        ),
      ),
    );
  }
}
