import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'color_resources.dart';
import 'constants.dart';

class Helper {
  static int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  static deleteDialog(String title, {Function()? onDelete}) {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.WARNING,
      headerAnimationLoop: false,
      animType: AnimType.TOPSLIDE,
      width: MediaQuery.of(Get.context!).size.width * .3,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'Delete $title?',
      desc: 'Are you sure want to delete $title?',
      btnCancelOnPress: onDelete,
      btnOkText: "Cancel",
      btnCancelText: "Delete",
      onDissmissCallback: (type) {},
      btnOkOnPress: () {},
    ).show();
  }

  static paymentDialog(String title, {Function()? onDelete}) {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.WARNING,
      headerAnimationLoop: false,
      animType: AnimType.TOPSLIDE,
      width: MediaQuery.of(Get.context!).size.width * .3,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'Delete $title?',
      desc: 'Are you sure want to delete $title?',
      btnCancelOnPress: onDelete,
      btnOkText: "Cancel",
      btnCancelText: "Delete",
      onDissmissCallback: (type) {},
      btnOkOnPress: () {},
    ).show();
  }

  static bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static void showMyToast(String msg, {int duration = 5}) {
    if (Get.context != null) {
      FlutterToastr.show(msg, Get.overlayContext!, duration: duration);
    } else {
      print('NUllllllllllllllllllllllllllll');
    }
  }

  static String getFormattedTime(
    int timeMicro, {
    bool onlyDate = false,
    bool isSingleLine = false,
  }) {
    return DateFormat(
            'dd-MM-yyyy${isSingleLine ? " " : "\n"}${onlyDate ? "" : "KK:mm:a"}')
        .format(DateTime.fromMicrosecondsSinceEpoch(timeMicro));
  }

  static Widget tileMy(title, subTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(subTitle.toString()),
          const Divider(),
        ],
      ),
    );
  }

  static Widget valueUpdateWidget(double value, String title,
      {int? availableQuantity, required Function(double value) onCall}) {
    TextEditingController controller = TextEditingController();

    controller.addListener(() {
      if (value != double.parse(controller.text)) {
        if (double.parse(controller.text) < 1) {
          controller.text = "1";
        }
        if (availableQuantity != null &&
            double.parse(controller.text) >= availableQuantity) {
          controller.text = availableQuantity.toString();
        }
        if (availableQuantity != null && availableQuantity == 0) {
          controller.text = "0";
        }
        onCall(double.parse(controller.text));
      }
    });
    controller.text = value.toString();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: value <= 1
              ? null
              : () {
                  controller.text = (value - 1).toString();
                },
          icon: const Icon(Icons.remove, color: ColorResources.primaryColor),
        ),
        SizedBox(
          width: 50,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: title,
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
        ),
        IconButton(
            onPressed: availableQuantity != null && value >= availableQuantity
                ? null
                : () {
                    String aa = (value + 1).toString();
                    controller.text = aa;
                  },
            icon: const Icon(Icons.add),
            color: ColorResources.primaryColor),
      ],
    );
  }

  static Widget tableTextWidget(String text,
      {Alignment alignment = Alignment.centerLeft}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: alignment,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static AppBar appBarMy(String title,
      {isCenter = false, List<Widget>? actions}) {
    return AppBar(
      title: Text(title),
      centerTitle: isCenter,
      actions: actions,
    );
  }
}
