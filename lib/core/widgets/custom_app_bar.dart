import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/test_style.dart';
import 'package:fruit_app/core/widgets/custom_notification.dart';

AppBar buildAppBar(context,
    {required String title,
    bool showBackButton = true,
    bool showNotification = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: [
      Visibility(
        visible: showNotification,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      )
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
