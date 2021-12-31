import 'package:english_day/pages/home_page.dart';
import 'package:english_day/value/app_assest.dart';
import 'package:english_day/value/app_colors.dart';
import 'package:english_day/value/app_style.dart';
import 'package:flutter/material.dart';

class LandingpPage extends StatelessWidget {
  const LandingpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome to',
                  style: AppStyle.h3,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'English',
                      style: AppStyle.h2.copyWith(
                          color: AppColors.blackGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        'Qoutes"',
                        textAlign: TextAlign.right,
                        style: AppStyle.h4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: RawMaterialButton(
                      shape: CircleBorder(),
                      fillColor: AppColors.lightBlue,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            //Khong ve trang dau nua
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                            (route) => false);
                      },
                      child: Image.asset(AppAssets.rightArrow3x)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
