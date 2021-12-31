import 'package:english_day/value/app_assest.dart';
import 'package:english_day/value/app_colors.dart';
import 'package:english_day/value/app_style.dart';
import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  _ControlPageState createState() => _ControlPageState();
}

double slideValue = 5;

class _ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0, //đường thẳng dướu appbar
        title: Text(
          'You Control',
          style: AppStyle.h4.copyWith(color: AppColors.textColor),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow3x),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Text(
              'How much a number word at once ?',
              style: AppStyle.h4
                  .copyWith(color: AppColors.lightGrey, fontSize: 18),
            ),
            Spacer(),
            Text(
              '${slideValue.toInt()}',
              style: AppStyle.h1.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 150,
                  fontWeight: FontWeight.bold),
            ),
            Slider(
                value: slideValue,
                min: 5,
                max: 100,
                divisions: 95,
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.primaryColor,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    slideValue = value;
                  });
                }),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              alignment: Alignment.centerLeft,
              child: Text(
                'Slide to set',
                style: AppStyle.h5.copyWith(color: AppColors.textColor),
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
