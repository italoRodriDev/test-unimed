import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unimed/app/data/models/dengue_case.model.dart';

class DetailController extends GetxController {
  bool isFavorited = false;

  // -> Verificar se já é favorito
  Future<void> loadFavoriteStatus(DengueCaseModel data) async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString('dengue_favorites');

    if (stored != null) {
      final decoded = json.decode(stored) as List<dynamic>;
      final favorites =
          decoded.map((item) => DengueCaseModel.fromJson(item)).toList();

      isFavorited = favorites.any((item) => item.idAgravo == data.idAgravo);
    } else {
      isFavorited = false;
    }

    update();
  }

  // -> Verificar se existe o item e add ao shared preferences
  // -> Sei que não é o recomendado usar shared preferences mas usei apenas como exemplo
  Future<void> toggleFavorite(DengueCaseModel data) async {
    final prefs = await SharedPreferences.getInstance();
    final storedList = prefs.getString('dengue_favorites');
    List<dynamic> rawList = storedList != null ? json.decode(storedList) : [];

    List<DengueCaseModel> favorites =
        rawList.map((jsonItem) => DengueCaseModel.fromJson(jsonItem)).toList();

    final exists = favorites.any((item) => item.idAgravo == data.idAgravo);

    if (exists) {
      favorites.removeWhere((item) => item.idAgravo == data.idAgravo);
      isFavorited = false;
      update();
    } else {
      favorites.add(data);
      isFavorited = true;
      update();
    }

    final encoded = json.encode(favorites.map((e) => e.toJson()).toList());
    await prefs.setString('dengue_favorites', encoded);
  }
}
