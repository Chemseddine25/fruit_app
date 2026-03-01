import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.title,
      required this.stepNumber,
      required this.isSelected});

  final String title;
  final String stepNumber;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: ActiveStepItem(title: title),
        secondChild: InActiveStepItem(title: title, stepNumber: stepNumber),
        crossFadeState:
            isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(seconds: 1));
  }
}
