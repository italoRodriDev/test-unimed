import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:unimed/app/data/models/dengue_case.model.dart';

class CardDengueCaseComponent extends StatefulWidget {
  DengueCaseModel data;
  CardDengueCaseComponent({super.key, required this.data});

  @override
  State<CardDengueCaseComponent> createState() =>
      _CardDengueCaseComponentState();
}

class _CardDengueCaseComponentState extends State<CardDengueCaseComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
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
          SizedBox(height: 12),
          Row(
            children: [
              TextComponent(
                value: 'Febre: ${widget.data.temFebre ? 'Sim' : 'Não'}',
              ),
              SizedBox(width: 16),
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
