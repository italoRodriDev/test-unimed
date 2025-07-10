import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';

import '../../../data/models/dengue_case.model.dart';
import '../../home/view/components/card_case.component.dart';
import '../controller/favorites.controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  FavoritesController ctrl = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ctrl,
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                  title: TextComponent(value: 'Meus Favoritos', fontSize: 18)),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                ValueListenableBuilder(
                    valueListenable: ctrl.listDengueCasesEvent,
                    builder: (context, List<DengueCaseModel> listCases, child) {
                      if (listCases.isNotEmpty) {
                        return SizedBox(
                            height: 350,
                            child: ListView.builder(
                                itemCount: listCases.length,
                                itemBuilder: (context, index) {
                                  DengueCaseModel caseData = listCases[index];

                                  return CardDengueCaseComponent(
                                      data: caseData);
                                }));
                      } else {
                        return Center(
                            child:
                                TextComponent(value: 'Nenhum caso adicionado'));
                      }
                    })
              ]))));
        });
  }
}
