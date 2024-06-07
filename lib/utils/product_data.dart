// product_data.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:bharti_creation_app/model/product_model.dart';

class ProductData {
  static Future<List<Product>> fetchNamePlate() async {
    final String response =
        await rootBundle.loadString('assets/files/name_plate.json');
    final data = await json.decode(response);
    return (data['Products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();
  }

  static Future<List<Product>> fetchDndPanel() async {
    final String response =
        await rootBundle.loadString('assets/files/dnd_panel.json');
    final data = await json.decode(response);
    return (data['Products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();
  }

  static Future<List<Product>> fetchLedNamePlate() async {
    final String response =
        await rootBundle.loadString('assets/files/led_name_plate.json');
    final data = await json.decode(response);
    return (data['Products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();
  }

  static Future<List<Product>> fetchSocityNameBoard() async {
    final String response =
        await rootBundle.loadString('assets/files/socity_name_board.json');
    final data = await json.decode(response);
    return (data['Products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();
  }
}
