import 'package:flutter_test/flutter_test.dart';
import 'package:unimed/app/modules/home/controller/home.controller.dart';

void main() {
  test('Testa valores iniciais do HomeController', () {
    final controller = HomeController();

    expect(controller.year, 2025);
    expect(controller.quantity, 10);
  });
}
