import 'package:flutter_test/flutter_test.dart';
import '../models/load_data.dart';
import '../models/user.dart';

void main() {
  group('User Info Tests', () {
    testWidgets('Test UserInfo creation', (WidgetTester tester) async {
      await loadLocationData();
      // Tạo dữ liệu mẫu cho UserInfo
      final Map<String, dynamic> userInfoMap = {
        'name': 'Nguyen Sy Long',
        'email': 'longcanh2k3@gmail,com',
        'phoneNumber': '123456789',
        'birthDate': '2003-08-11',
        'address': {
          'province': {
            'id': provinceList[0].id,
            'name': provinceList[0].name,
            'level': provinceList[0].level,
          },
          'district': {
            'id': districtList[2].id,
            'name': districtList[2].name,
            'level': districtList[2].level,
            'provinceId': districtList[2].provinceId,
          },
          'ward': {
            'id': wardList[2].id,
            'name': wardList[2].name,
            'level': wardList[2].level,
            'districtId': wardList[2].districtId,
            'provinceId': wardList[2].provinceId,
          },
          'street': '1 Kim Hoàng',
        },
      };
      final userInfo = UserInfo.fromMap(userInfoMap);

      // Kiểm tra các thuộc tính của UserInfo
      expect(userInfo.name, 'Nguyen Sy Long');
      expect(userInfo.email, 'longcanh2k3@gmail,com');
      expect(userInfo.phoneNumber, '123456789');
      expect(userInfo.birthDate, DateTime(2003, 08, 11));
      expect(userInfo.address!.province!.name, 'Thành phố Hà Nội');
      expect(userInfo.address!.district!.name, 'Huyện Hoài Đức');
      expect(userInfo.address!.ward!.name, 'Xã Vân Canh');
      expect(userInfo.address!.street, '1 Kim Hoàng');
    });
  });
}
