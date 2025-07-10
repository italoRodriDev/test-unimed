import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';
import 'package:unimed/app/config/colors/colors.dart';
import 'package:unimed/app/config/fonts/fonts.dart';
import 'package:unimed/app/data/models/dengue_case.model.dart';
import 'package:unimed/app/routers/app_routers.dart';

class CardDetailDengueCaseComponent extends StatefulWidget {
  DengueCaseModel data;
  CardDetailDengueCaseComponent({super.key, required this.data});

  @override
  State<CardDetailDengueCaseComponent> createState() =>
      _CardDetailDengueCaseComponentState();
}

class _CardDetailDengueCaseComponentState
    extends State<CardDetailDengueCaseComponent> {
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
          TextComponent(
              value: '${widget.data.id} - ${widget.data.idAgravo}',
              fontWeight: FontWeight.w700,
              fontSize: 33,
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
        ],
      ),
    );
  }
}
