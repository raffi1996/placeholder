import 'package:freezed_annotation/freezed_annotation.dart';

import '../address_model/address_model.dart';
import '../company_model/company_model.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required AddressModel address,
    required String website,
    required CompanyModel company,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
