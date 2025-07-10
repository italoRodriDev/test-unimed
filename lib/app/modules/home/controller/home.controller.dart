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
  List<DengueCaseModel> listFilter = [];
  int year = DateTime.now().year;
  int quantity = 100;

  @override
  void onReady() {
    getListCasesDengue(quantity);
    super.onReady();
  }

  // -> Filtrar casos por ano de registro
  onChangeYear(int newYear) {
    year = newYear;
    clearList;
    getListCasesDengue(quantity);
  }

  // -> Filtrar casos por pesquisa
  onSearchItemsCode(String query) {
    if (query.length > 3) {
      final results = listFilter
          .where((el) => el.id!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      listDengueCasesEvent.value = results;
    } else {
      getListCasesDengue(quantity);
    }
  }

  // -> Filtrar casos por quantidade
  onChangeQuantity(int newQuantity) {
    quantity = newQuantity;
    clearList;
    getListCasesDengue(newQuantity);
  }

  // -> Recuperar lista de casos

  getListCasesDengue(int limit) async {
    Response res =
        await dataHealthRepo.getCasesDengue(year: year, limitCases: limit);

    AuthStatusCode.getStatus(res, (success) async {
      final params = res.body['parametros'] as List;

      if (params.isNotEmpty) {
        final allCases =
            params.map((e) => DengueCaseModel.fromJson(e)).toList();

        final uniqueCases = <String, DengueCaseModel>{};
        for (var caseItem in allCases) {
          if (caseItem.id != null) {
            uniqueCases[caseItem.id!] = caseItem;
          }
        }

        final cases = uniqueCases.values.toList();

        listDengueCasesEvent.value = cases;
        listFilter = cases;
      } else {
        await SnackbarComponent.show(Get.context!,
            text: 'Nenhum dado encontrado!');
      }
    }, (error) async {
      await SnackbarComponent.show(Get.context!,
          text: 'Erro ao recuperar dados!');
    });
  }

  // -> Limpar lista de casos
  clearList() {
    listDengueCasesEvent.value.clear();
    listFilter.clear();
  }
}
