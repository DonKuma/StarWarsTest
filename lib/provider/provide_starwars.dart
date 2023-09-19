import 'package:flutter/material.dart';
import '../model/cast_model.dart';
import '../services/get_starwars.dart';

class StarWarsProvider extends ChangeNotifier {
  final _service = GenerationService();
  bool? isLoading;
  List<Cast> _cast = [];
  List<Cast> get cast => _cast;

  Future<void> getAll() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getStarWars();

    _cast = response.cast!;

    isLoading = false;

    notifyListeners();
  }
}
