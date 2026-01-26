import 'package:flutter/material.dart';

import 'widgets/onbording_view_body.dart';

class OnbordingView extends StatelessWidget {
  const OnbordingView({super.key});
  static const String routeName = 'onbording';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnbordingViewBody()));
  }
}
