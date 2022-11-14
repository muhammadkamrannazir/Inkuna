import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Auth/Screens/login_screen.dart';
import '../Models/user_model.dart';
import 'color_resources.dart';

const String enableStatus = "1";
const String baseUrlMy = "https://education.fanastify.com";
const String imagesUrl = "$baseUrlMy/assets/uploads";
const String disableStatus = "0";
const String typeUserImages = "UserImages";
const List<String> paymentMethods = ["Cash", "Cheque", "Credit", "Online"];
const List<String> paymentTypes = ["Purchase", "Payment", "Delivery"];
const List<String> ledgerPaymentMethods = ["Cash", "Cheque", "Online"];
const String invoiceType = "Invoice";
const String quotationType = "Quotation";
int navigationIndex = 0;
bool isExtended = true;

int a = 9;
List<int> perPageDropDownArray = [
  20,
  50,
  100,
  200,
  500,
  1000,
  2000,
  5000,
  10000,
  20000
];

String getFormattedTime(String dateTime,
    {bool isSingleLine = false, bool onlyDate = false}) {
  return DateFormat(
          'dd-MM-yyyy${onlyDate ? "" : isSingleLine ? "KK:mm:a" : "\nKK:mm:a"}')
      .format(DateTime.fromMicrosecondsSinceEpoch(int.parse(dateTime)));
}

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}

// getFeedbacckMapping()["1"]
Map getFeedbackMapping() {
  return {
    '1': 'Schedule Visit',
    '2': 'Follow Up',
    '3': 'Callback',
    '4': 'Not Interested',
    "5": "Other",
    "6": "Sales Done"
  };
}

saveAndUpdateUserToStorage(UserModel userModel) {
  GetStorage().remove("user");

  GetStorage().write('user', userModel.toJson());
}

logOut() {
  GetStorage().remove("user");

  Get.offAllNamed(LoginScreen.routeName);
}

UserModel? getUserFromStorage() {
  if (GetStorage().read("user") != null) {
    return UserModel.fromJson(GetStorage().read("user"));
  }
  return null;
}

Map getOpenFeedbackMapping() {
  return {'1': 'Schedule Visit', '2': 'Follow Up', '3': 'Assigned a Callback'};
}

Map getClosedFeedbackMapping() {
  return {'4': 'Not Interested', "5": "Other", "6": "Sale Done"};
}

Future<String?> pickImageDialog(BuildContext context) async {
  String? selected;
  await showDialog<String>(
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Image'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                selected = "Camera";
                Navigator.pop(context);
              },
              child: const Text('From Camera'),
            ),
            SimpleDialogOption(
              onPressed: () {
                selected = "Gallery";
                Navigator.pop(context);
              },
              child: const Text('From Gallery'),
            ),
          ],
        );
      },
      context: context);
  return selected;
}

String getMonthName(int i) {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  return months[i - 1];
}

String getFileExtension(String fileName) {
  return fileName.split('.').last;
}

Widget tileMy(title, subtile) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          // style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          subtile,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: ColorResources.primaryColor),
          textAlign: TextAlign.center,
        ),
        const Divider(),
      ],
    ),
  );
}

Widget priceTagRedWidget(price) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    decoration: const BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(Radius.circular(6.0))),
    child: Text("$price",
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
  );
}

Widget priceTagGreenWidget(price) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(6.0))),
    child: Text("$price Rs",
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
  );
}

Widget swipeCallWidget(phone) {
  return Container(
    color: ColorResources.primaryColor,
    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        imageBtn("whatsapp_icon", () {
          launch("https://api.whatsapp.com/send?phone=$phone");
        }),
        imageBtn("message_icon", () {
          launch("sms:$phone");
        }),
        imageBtn("call_icon", () {
          launch("tel:$phone");
        }),
      ],
    ),
  );
}

Widget imageBtn(String icon, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Image.asset(
        "assets/icons/$icon.png",
        height: 30,
        width: 30,
      ),
    ),
  );
}

String getErrors(Map input) {
  // List<dynamic> newList = input.values.toList();
  List<String> newList = List<String>.from(input.values.toList());
  return newList.join("\n");
}

showSnackBar(text) {
  final snackBar = SnackBar(content: Text(text));
  if (Get.context != null) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
