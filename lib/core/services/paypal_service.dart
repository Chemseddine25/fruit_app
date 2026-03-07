import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/paypel_entities/paypel_enity.dart';

class PaypalService {
  static const String clientId =
      "AVT7l1Y6XInknEGSqYcShAaoyE0GvJAPMjwetPX2NhdEdNtWFvyJBBD24u3NRbjLpq6WPtolUC0h_X6O";
  static const String secretKey =
      "EM5EhFXZS4FgGV9OXz7BzfGX4wdVA8JZPaeZgw6T73ePNihKKMl-SB04bGlp5L-hmWFh_Woxoc7n5B16";

  void payWithPaypal({
    required BuildContext context,
    required PaypalPaymentEntity paymentEntity,
    required Function(Map) onSuccess,
    required Function(dynamic) onError,
    required Function() onCancel,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: clientId,
          secretKey: secretKey,
          transactions: [
            paymentEntity.toJson(),
          ],
          note: "Contact us for any questions. ",
          onSuccess: onSuccess,
          onError: onError,
          onCancel: onCancel,
        ),
      ),
    );
  }
}
