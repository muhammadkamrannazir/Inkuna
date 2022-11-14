import 'package:flutter/material.dart';

import '../Utils/color_resources.dart';

class CustomButton extends StatelessWidget {
  final Function? onTap;
  final String? btnTxt;
  final Color? backgroundColor;

  const CustomButton(
      {super.key, this.onTap, required this.btnTxt, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onTap == null
          ? ColorResources.gray
          : backgroundColor ?? Theme.of(context).primaryColor,
      // minimumSize: Size(MediaQuery.of(context).size.width, 50),
      padding: EdgeInsets.zero,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return ElevatedButton(
      onPressed: onTap as void Function()?,
      style: flatButtonStyle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
        child: Text(
          btnTxt ?? "",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
