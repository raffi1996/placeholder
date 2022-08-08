import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';

part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  factory AddressModel({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
