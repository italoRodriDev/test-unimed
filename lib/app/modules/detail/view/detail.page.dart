import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_crise/components/toggle-bubble.component.dart';
import 'package:get/get.dart';
import 'package:unimed/app/config/colors/colors.dart';
import 'package:unimed/app/modules/detail/controller/detail.controller.dart';
import 'package:unimed/app/modules/detail/view/components/card_detail_case.component.dart';

class DetailPage extends GetView<DetailController> {
  DetailController ctrl = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    if (data == null) {
      Get.back();
    }

    ctrl.loadFavoriteStatus(data);
    return GetBuilder(
        init: ctrl,
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(actions: [
                Padding(
                  padding: EdgeInsets.all(2),
                  child: ToggleBubbleComponent(
                      iconSize: 20,
                      icon: Icons.favorite,
                      iconColor: controller.isFavorited
                          ? AppColor.success
                          : AppColor.medium,
                      onPressed: () {
                        ctrl.toggleFavorite(data);
                      }),
                )
              ], title: TextComponent(value: 'Detalhes do caso', fontSize: 18)),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Image.network(
                  'https://www.unimedlondrina.com.br/img/news/4009/integra.jpg',
                ),
                CardDetailDengueCaseComponent(data: data),
              ]))));
        });
  }
}
