import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_app/core/utils/app_keys.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/paypel_entities/paypel_enity.dart';

class PaypalService {
  static const String clientId = kpaypalIdClein;

  static const String secretKey = kpaypalSecret;

  bool _isSuccessCalled = false;

  void payWithPaypal({
    required BuildContext context,
    required PaypalPaymentEntity paymentEntity,
    required Function(Map) onSuccess,
    required Function(dynamic) onError,
    required Function() onCancel,
  }) {
    _isSuccessCalled = false;

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
