import 'package:flutter/material.dart';
import 'package:flutter_crise/components/select.component.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_crise/components/search.component.dart';
import 'package:get/get.dart';
import 'package:unimed/app/config/colors/colors.dart';
import 'package:unimed/app/data/models/dengue_case.model.dart';
import 'package:unimed/app/modules/home/view/components/card_case.component.dart';
import 'package:flutter_crise/components/carrousel-image.component.dart';
import 'package:unimed/app/routers/app_routers.dart';
import '../controller/home.controller.dart';

class HomePage extends GetView<HomeController> {
  HomeController ctrl = Get.put(HomeController());

  List<MenuItemData> years = const [
    MenuItemData(label: '2025', value: 2025),
    MenuItemData(label: '2024', value: 2024),
    MenuItemData(label: '2023', value: 2023),
    MenuItemData(label: '2022', value: 2022),
    MenuItemData(label: '2021', value: 2021),
    MenuItemData(label: '2020', value: 2020),
  ];

  List<MenuItemData> quantities = const [
    MenuItemData(label: '1', value: 1),
    MenuItemData(label: '5', value: 5),
    MenuItemData(label: '10', value: 10),
    MenuItemData(label: '20', value: 20),
    MenuItemData(label: '100', value: 100),
  ];

  List<String> images = [
    'https://d3rf2zoedgusog.cloudfront.net/wp-content/uploads/2021/08/GAD_4514-Editar.jpg',
    'https://www.unimedjp.com.br/painel/uploads/institucional/large/7f1b9c5d3a20200727045303.jpg',
    'https://i0.wp.com/www.maispb.com.br/wp-content/uploads/2016/02/hospital-unimed.jpg?fit=675%2C450&quality=90&strip=all&ssl=1'
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ctrl,
        builder: (controller) {
          return WillPopScope(
              child: Scaffold(
                  appBar: AppBar(
                    actions: [
                      IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.FAVORITES);
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: AppColor.danger,
                          ))
                    ],
                  ),
                  body: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        CarrouselImageComponent(
                            imageUrls: images, onPageLongClick: (change) {}),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextComponent(
                              color: AppColor.primary,
                              value: 'Casos de Dengue na Paraíba',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 10),
                            child: SelectComponent(
                                width: double.maxFinite,
                                initialValue: controller.year,
                                labelText: 'Selecione o ano',
                                primaryColor: AppColor.primary,
                                menuItemData: years,
                                onChanged: (value) {
                                  ctrl.onChangeYear(value);
                                })),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: SelectComponent(
                                width: double.maxFinite,
                                initialValue: controller.quantity,
                                labelText: 'Selecione a quantidade',
                                primaryColor: AppColor.primary,
                                menuItemData: quantities,
                                onChanged: (value) {
                                  ctrl.onChangeQuantity(value);
                                })),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: SearchComponent(
                                borderRadius: 36,
                                hintText: 'Buscar por sexo... ex: masculino',
                                prefixIconData: Icons.search,
                                onChanged: (query) {
                                  ctrl.onSearchItemsCode(query);
                                })),
                        const SizedBox(height: 10),
                        Divider(
                          height: 1,
                          color: AppColor.medium,
                        ),
                        ValueListenableBuilder(
                            valueListenable: ctrl.listDengueCasesEvent,
                            builder: (context, List<DengueCaseModel> listCases,
                                child) {
                              if (listCases.isNotEmpty) {
                                return SizedBox(
                                    height: 350,
                                    child: ListView.builder(
                                        itemCount: listCases.length,
                                        itemBuilder: (context, index) {
                                          DengueCaseModel caseData =
                                              listCases[index];

                                          return CardDengueCaseComponent(
                                              data: caseData);
                                        }));
                              } else {
                                return Center(
                                    child: TextComponent(
                                        value: 'Nenhum caso encontrado'));
                              }
                            })
                      ],
                    )),
                  )),
              onWillPop: () async => false);
        });
  }
}
