import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkuna/utils/app_colors.dart';
import 'package:inkuna/utils/app_sizes.dart';
import 'package:inkuna/views/pages/Teacher/dashboard.dart';
import 'package:inkuna/views/widgets/Custom_Button.dart';
import 'package:inkuna/views/widgets/rounded_button.dart';

class EvaluationPeriodPage extends StatelessWidget {
  EvaluationPeriodPage({super.key});

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
            MyRoundedButton(
              name: 'Bimonthly',
              onPressed: () {},
              color: MyColor.amber,
              width: 180.w,
              textColor: Colors.black,
            ),
            const SizedBox(height: 20),
            MyRoundedButton(
              name: 'quaterly',
              onPressed: () {},
              color: Colors.white,
              width: 180.w,
              textColor: Colors.black,
            ),
            const SizedBox(height: 20),
            MyRoundedButton(
              name: 'biannual',
              onPressed: () {},
              color: Colors.white,
              textColor: Colors.black,
              width: 180.w,
            ),
            const SizedBox(height: 110),
            MyButton(
              name: 'Done',
              onPressed: () {
                Get.to(TeacherDashboard());
              },
              color: Colors.white,
              textColor: MyColor.blue,
            ),
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
            text: 'Evaluation Periods',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
        ),
      ],
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
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
