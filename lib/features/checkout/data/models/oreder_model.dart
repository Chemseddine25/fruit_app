import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/domain/enitities/order_entities/shippinig_adress_entity.dart';

class CheckoutProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  ShpippingAdressEntity? shippingAdress;

  bool saveAddress() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      shippingAdress = ShpippingAdressEntity(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        city: cityController.text,
        adress: addressController.text,
      );

      notifyListeners();
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
