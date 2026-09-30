import 'package:buisness_manager/core/constants/app_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('app constants are set correctly', () {
    expect(AppConstants.appName, 'Business Manager');
    expect(AppConstants.defaultCurrencyCode, 'BDT');
  });
}
