import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bumble_scrollbar/bumble_scrollbar.dart';

void main() {
  const MethodChannel channel = MethodChannel('bumble_scrollbar');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await BumbleScrollbar.platformVersion, '42');
  });
}
