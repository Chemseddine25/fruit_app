import 'package:flutter/material.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.controller,
  });
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: getpages.length,
        itemBuilder: (context, index) {
          return getpages[index];
        });
  }
}

List<Widget> getpages = [
  const Text("page 1"),
  const Text("page 2"),
  const Text("page 3"),
  const Text("page 4"),
];
