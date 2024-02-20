import 'package:flutter_test/flutter_test.dart';

import '../models/load_data.dart';
import '../models/province.dart';

void main() {
  group('Province Tests', () {
    testWidgets('Test Province creation from map', (WidgetTester tester) async {
      await loadLocationData();

      int index = 0;

      Map<String, dynamic> map = {
        'id': provinceList[index].id,
        'name': provinceList[index].name,
        'level': provinceList[index].level,
      };

      Province province = Province.fromMap(map);

      expect(province.id, provinceList[index].id);
      expect(province.name, provinceList[index].name);
      expect(province.level, provinceList[index].level);
    });
  });
}
