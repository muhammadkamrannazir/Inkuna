import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkuna/utils/app_colors.dart';
import 'package:inkuna/utils/app_sizes.dart';
import 'package:inkuna/views/choose_role_controller.dart';
import 'package:inkuna/views/pages/Auth/login.dart';
import 'package:inkuna/views/widgets/Custom_Button.dart';
import 'package:inkuna/views/widgets/my_text.dart';

class ChooseRoleScreen extends StatelessWidget {
  final chooseRoleController = Get.put(ChooseRoleController());
  ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Center(
          child: Padding(
            padding: screen_Padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 60.h),
                MyText(
                  text: 'Welcome and Welcome',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  text:
                      'to the digital school management system for teacher, students and parents',
                  fontSize: 18.sp,
                ),
                SizedBox(height: 50.h),
                MyText(
                  text: 'Choose Your Role here',
                  fontSize: 20,
                  color: MyColor.primary,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 10.h),
                chooseRoleButton(title: 'Teacher', status: RoleStatus.TEACHER),
                chooseRoleButton(title: 'Parents', status: RoleStatus.PARENTS),
                chooseRoleButton(title: 'Student', status: RoleStatus.STUDENT),
                const Expanded(child: SizedBox()),
                MyButton(
                  name: 'Next',
                  onPressed: () {
                    // chooseRoleController.changeRoleStatus(
                    //     roleStatus:
                    //         chooseRoleController.currentRoleStatus.value);
                    // print(chooseRoleController.getCurrentRole());
                    Get.to(LoginPage());
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  chooseRoleButton({String? title, RoleStatus? status}) {
    bool isSelected =
        chooseRoleController.currentRoleStatus.value.name.toLowerCase() ==
            title?.toLowerCase();

    return GestureDetector(
      onTap: () {
        chooseRoleController.changeRoleStatus(roleStatus: status!);
      },
      child: Column(
        children: [
          Builder(builder: (context) {
            return Stack(
              children: [
                CircleAvatar(
                  radius: 60.r,
                  backgroundColor: isSelected ? MyColor.primary : MyColor.grey,
                  child: CircleAvatar(
                    radius: 59.r,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: isSelected ? MyColor.primary : MyColor.grey,
                      ),
                    ),
                  ),
                ),
                isSelected == true
                    ? Padding(
                        padding: EdgeInsets.only(left: 85.w, top: 6.h),
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: MyColor.primary,
                          child: Center(
                            child: Icon(
                              Icons.check_rounded,
                              size: 16.r,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          }),
          SizedBox(height: 5.h),
          Text(
            "$title",
            style: TextStyle(
              fontSize: 18.sp,
              color: isSelected ? MyColor.primary : MyColor.grey,
            ),
          )
        ],
      ),
    );
  }
}
