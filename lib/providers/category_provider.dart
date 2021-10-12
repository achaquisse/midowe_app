import 'dart:convert';

import 'package:midowe_app/models/category_model.dart';
import 'package:midowe_app/providers/base_provider.dart';

class CategoryProvider extends BaseProvider {
  Future<List<Category>> fetchCategories() async {
    final response = await cmsGet("/categories");

    if (response.statusCode == 200) {
      final categories = (jsonDecode(response.body) as List)
          .map((i) => Category.fromJson(i))
          .toList();
      return categories;
    } else {
      throw Exception(
          "Failed to fetch categories. Error ${response.statusCode}");
    }
  }
}
