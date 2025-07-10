import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/dengue_case.model.dart';

class FavoritesController extends GetxController {
  ValueNotifier<List<DengueCaseModel>> listDengueCasesEvent =
      ValueNotifier<List<DengueCaseModel>>([]);

  @override
  void onReady() {
    loadFavorites();
    super.onReady();
  }

  // -> Recuperar favoritos
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString('dengue_favorite'); // <- nome atualizado

    if (stored != null) {
      final decoded = json.decode(stored);
      final favorite = DengueCaseModel.fromFavoritesJson(decoded);

      listDengueCasesEvent.value = [favorite]; // Apenas 1 item na lista
    } else {
      listDengueCasesEvent.value = [];
    }
  }

  // Desfavoritar
  Future<void> removeFavorite() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('dengue_favorite');

    listDengueCasesEvent.value = [];
  }
}
