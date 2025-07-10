import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unimed/app/data/models/dengue_case.model.dart';

class DetailController extends GetxController {
  bool isFavorited = false;

  // -> Verificar se já é favorito
  Future<void> loadFavoriteStatus(DengueCaseModel data) async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString('dengue_favorite');

    if (stored != null) {
      final storedModel = DengueCaseModel.fromJson(json.decode(stored));
      isFavorited = storedModel.id == data.id;
    } else {
      isFavorited = false;
    }

    update();
  }

  // -> Verificar se existe o item e add ao shared preferences
  // -> Sei que não é o recomendado usar shared preferences mas usei apenas como exemplo
  Future<void> toggleFavorite(DengueCaseModel data) async {
    final prefs = await SharedPreferences.getInstance();

    // Se já está favoritado, remove (limpa a string)
    if (isFavorited) {
      await prefs.remove('dengue_favorite');
      isFavorited = false;
    } else {
      final encoded = json.encode(data.toJson());
      await prefs.setString('dengue_favorite', encoded);
      isFavorited = true;
    }

    update();
  }
}
