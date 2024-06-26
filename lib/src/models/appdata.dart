import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  var favorites = [];

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  List favoriteCities() {
    List result = [];
    for (var favorite in favorites) {
      List foundCities = this.searchCity(favorite);
      if (foundCities.isNotEmpty) {
        result.add(foundCities[0]);
      }
    }
    return result;
  }

  List searchCity(text) {
    List result = [];
    text = text.trim().toLowerCase();
    if (text == '') {
      return [];
    }

    for (var continents in data) {
      for (var country in continents['countries']) {
        for (var city in country['cities']) {
          if (city['name'].toLowerCase().contains(text)) {
            result.add(city);
          }
        }
      }
    }
    return result;
  }

  bool hasFavorite(cityName) {
    return favorites.contains(cityName);
  }

  bool favorite(cityName) {
    if (hasFavorite(cityName)) {
      favorites.remove(cityName);
      return false;
    }
    favorites.add(cityName);
    return true;
  }

  Future<bool> requestData() async {
    final res = await http.get(
      Uri.parse('https://api.b7web.com.br/flutter1wb/'),
    );

    if (res.statusCode == 200) {
      setData(jsonDecode(res.body));
      return true;
    }
    return false;
  }
}
