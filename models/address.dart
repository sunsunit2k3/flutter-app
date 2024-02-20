import 'district.dart';
import 'province.dart';
import 'ward.dart';

class Address {
  final Province? province;
  final District? district;
  final Ward? ward;
  final String? street;

  Address({this.province, this.district, this.ward, this.street});

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      province:
          map['province'] != null ? Province.fromMap(map['province']) : null,
      district:
          map['district'] != null ? District.fromMap(map['district']) : null,
      ward: map['ward'] != null ? Ward.fromMap(map['ward']) : null,
      street: map['street'],
    );
  }
}
