import 'package:flutter_test/flutter_test.dart';

import '../models/address.dart';
import '../models/load_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Address Infor Tests', () {
    test('Test AddressInfo creation', () async {
      await loadLocationData();
      final Map<String, dynamic> addressMap = {
        'province': {
          'id': provinceList[0].id,
          'name': provinceList[0].name,
          'level': provinceList[0].level
        },
        'district': {
          'id': districtList[0].id,
          'name': districtList[0].name,
          'level': districtList[0].level,
          'provinceId': districtList[0].provinceId
        },
        'ward': {
          'id': wardList[0].id,
          'name': wardList[0].name,
          'level': wardList[0].level,
          'districtId': wardList[0].districtId,
          'provinceId': wardList[0].provinceId
        },
        'street': '41 Hồng Hà'
      };
      final addressInfo = Address.fromMap(addressMap);

      // Test AddressInfo properties
      expect(addressInfo.province!.name, 'Thành phố Hà Nội');
      expect(addressInfo.district!.name, 'Quận Ba Đình');
      expect(addressInfo.ward!.name, 'Phường Phúc Xá');
      expect(addressInfo.street, '41 Hồng Hà');
    });
  });
}
