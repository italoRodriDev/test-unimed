import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_crise/components/toggle-bubble.component.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unimed/app/config/colors/colors.dart';
import 'package:unimed/app/config/fonts/fonts.dart';
import 'package:unimed/app/data/models/dengue_case.model.dart';
import 'package:unimed/app/routers/app_routers.dart';

class CardFavoriteDengueCaseComponent extends StatefulWidget {
  DengueCaseModel data;
  bool? showButtonDelete = false;
  Function? onChangeRemove;
  CardFavoriteDengueCaseComponent(
      {super.key,
      required this.data,
      this.showButtonDelete,
      this.onChangeRemove});

  @override
  State<CardFavoriteDengueCaseComponent> createState() =>
      _CardFavoriteDengueCaseComponentState();
}

class _CardFavoriteDengueCaseComponentState
    extends State<CardFavoriteDengueCaseComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
              onPressed: () {
                Get.toNamed(Routes.DETAIL, arguments: widget.data);
              },
              child: TextComponent(
                value: 'Ver detalhes',
                color: AppColor.primary,
              )),
          TextComponent(
              value: '${widget.data.id} - ${widget.data.idAgravo}',
              fontWeight: FontWeight.w700,
              fontFamily: AppFont.Jost,
              color: AppColor.primary),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextComponent(value: 'Caso de: ${widget.data.agravo}'),
                  TextComponent(value: 'Raça: ${widget.data.raca}'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextComponent(value: 'Sexo: ${widget.data.sexo}'),
                  TextComponent(
                    value: widget.data.isHospitalizado
                        ? 'Hospitalizado'
                        : 'Não Hospitalizado',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              TextComponent(
                value: 'Febre: ${widget.data.temFebre ? 'Sim' : 'Não'}',
              ),
              const SizedBox(width: 16),
              TextComponent(
                value: 'Mialgia: ${widget.data.temMialgia ? 'Sim' : 'Não'}',
              ),
            ],
          ),
          widget.showButtonDelete == true
              ? TextButton(
                  onPressed: () {
                    widget.onChangeRemove!();
                  },
                  child: TextComponent(
                    value: 'Remover dos favoritos',
                    color: AppColor.danger,
                  ))
              : Container()
        ],
      ),
    );
  }
}
