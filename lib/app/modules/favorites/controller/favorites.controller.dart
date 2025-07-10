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

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString('dengue_favorites');

    if (stored != null) {
      final decoded = json.decode(stored) as List<dynamic>;
      final favorites =
          decoded.map((item) => DengueCaseModel.fromJson(item)).toList();

      listDengueCasesEvent.value = favorites;
    } else {
      listDengueCasesEvent.value = [];
    }
  }
}
