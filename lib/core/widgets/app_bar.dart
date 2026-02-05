import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_notification.dart';

import '../utils/test_style.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.bold19,
      ),
    ),
  );
}
