import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/test_style.dart';

AppBar buildAppbar(BuildContext context, {required String title}) {
  return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyles.bold19,
        textAlign: TextAlign.center,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ));
}
