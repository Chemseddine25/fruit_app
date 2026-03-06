import 'package:fruit_app/features/checkout/presentation/domain/enitities/shippinig_adress_entity.dart';

class ShippingAddressModel {
  final String name;
  final String email;
  final String phone;
  final String city;
  final String address;

  ShippingAddressModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.address,
  });

  // تحويل من Entity إلى Model
  factory ShippingAddressModel.fromEntity(ShpippingAdressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      city: entity.city,
      address: entity.adress,
    );
  }

  // تحويل لـ Map لإرساله لـ Supabase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'city': city,
      'address': address,
    };
  }
}
