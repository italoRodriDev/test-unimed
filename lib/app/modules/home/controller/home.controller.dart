import 'package:flutter/material.dart';
import 'package:flutter_crise/components/snackbar.component.dart';
import 'package:get/get.dart';
import 'package:unimed/app/data/models/dengue_case.model.dart';
import 'package:unimed/app/data/provider/statuscode.provider.dart';
import 'package:unimed/app/data/repository/data_health.repository.dart';

class HomeController extends GetxController {
  DataHealthRepository dataHealthRepo = DataHealthRepository();
  ValueNotifier<List<DengueCaseModel>> listDengueCasesEvent =
      ValueNotifier<List<DengueCaseModel>>([]);
  int year = DateTime.now().year;
  int quantity = 10;

  @override
  void onReady() {
    getListCasesDengue(quantity);
    super.onReady();
  }

  onChangeYear(int newYear) {
    year = newYear;
    clearList;
    getListCasesDengue(quantity);
  }

  onChangeQuantity(int newQuantity) {
    quantity = newQuantity;
    clearList;
    getListCasesDengue(newQuantity);
  }

  getListCasesDengue(int limit) async {
    Response res =
        await dataHealthRepo.getCasesDengue(year: year, limitCases: limit);
    AuthStatusCode.getStatus(res, (success) {
      final params = res.body['parametros'] as List;
      final cases = params.map((e) => DengueCaseModel.fromJson(e)).toList();
      listDengueCasesEvent.value = cases;
    }, (error) async {
      await SnackbarComponent.show(Get.context!,
          text: 'Erro ao recuperar dados!');
    });
  }

  clearList() {
    listDengueCasesEvent.value.clear();
  }
}
