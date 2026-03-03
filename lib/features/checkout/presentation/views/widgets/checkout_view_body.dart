import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_boutton.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_step_item.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/page_view_checkout.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int currentPageIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CheckoutStepItem(
            currentPageIndex: currentPageIndex,
            controller: pageController,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: CheckoutPageView(controller: pageController),
          ),
          CustomButton(
              onPressed: () {
                setState(() {
                  if (currentPageIndex < getSteps.length - 1) {
                    pageController.animateToPage(currentPageIndex + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                });
              },
              text: 'مرحلة: ${getSteps[currentPageIndex]}'),
        ],
      ),
    );
  }
}
