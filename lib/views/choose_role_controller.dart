import 'package:get/get.dart';

enum RoleStatus {TEACHER, PARENTS, STUDENT }

class ChooseRoleController extends GetxController {
  
  Rx<RoleStatus> currentRoleStatus = RoleStatus.TEACHER.obs;

  changeRoleStatus({required RoleStatus roleStatus}) {
    currentRoleStatus.value = roleStatus;
  }

  // getCurrentRole() {
  //   switch (currentRoleStatus.value) {
  //     case RoleStatus.OWNER:
  //       Get.off(const CreateBrandScreen());
  //       break;
  //     case RoleStatus.CHEF:
  //       Get.off(const CreateChefScreen());
  //       break;
  //     case RoleStatus.MANAGER:
  //       Get.off(const CreateManagerScreen());
  //       break;
  //   }
  // }

  checkCurrentRole() {
    return currentRoleStatus.value;
  }
}
