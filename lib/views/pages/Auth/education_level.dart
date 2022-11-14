import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkuna/utils/app_colors.dart';
import 'package:inkuna/utils/app_images.dart';
import 'package:inkuna/utils/app_sizes.dart';
import 'package:inkuna/views/pages/Auth/evaluation_periods.dart';
import 'package:inkuna/views/widgets/Custom_Button.dart';
import 'package:inkuna/views/widgets/education_level_widget.dart';

class EducationLevel extends StatelessWidget {
  EducationLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.blue,
      body: Padding(
        padding: screen_Padding,
        child: Column(
          children: [
            SizedBox(height: 60.h),
            pageTitle(),
            SizedBox(height: 11.h),
            pageDescription(),
          ],
        ),
      ),
    );
  }

  pageTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'at what level\n',
            style: textStyle(),
            children: [
              TextSpan(
                text: 'educational jobs?',
                style: textStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  textStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
    );
  }

  pageDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text:
                'If you want to change it in the future, you can\n do it in the settings menu\n',
            style: textStyle(),
          ),
        ),
        const SizedBox(height: 35),
        EducationLevelCard(
            title: 'Initial Education',
            img: Assets.initial,
            textColor: MyColor.pink,
            backgroundColor: MyColor.pink),
        const SizedBox(height: 10),
        EducationLevelCard(
          title: 'Primary Education',
          img: Assets.twoStar,
          textColor: MyColor.teal,
          backgroundColor: MyColor.teal,
        ),
        const SizedBox(height: 10),
        EducationLevelCard(
          title: 'Secondary Education',
          img: Assets.threeStar,
          textColor: MyColor.purple,
          backgroundColor: MyColor.purple,
        ),
        const SizedBox(height: 110),
        MyButton(
          name: 'Next',
          onPressed: () {
            Get.to(EvaluationPeriodPage());
          },
          color: Colors.white,
          textColor: MyColor.blue,
        )
      ],
    );
  }
}
