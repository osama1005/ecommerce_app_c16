import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class CacheManager {
  static const String categoriesBoxName = "categoryName";
  static const String subCategoriesBoxName = "subCategoryName";

  static Future<void> inti() async {
    await Hive.initFlutter();
    await Hive.openBox(categoriesBoxName);
    await Hive.openBox(subCategoriesBoxName);
  }

  Box getCategoriesBoxName() => Hive.box(categoriesBoxName);
  Box getSubCategoriesBoxName() => Hive.box(subCategoriesBoxName);

  Future<void> saveCategory(List<Map<String, dynamic>> categories) async {
    final box = getCategoriesBoxName();
    await box.put("list of category", categories);
  }

  Future<void> saveSubCategory(
      String id, List<Map<String, dynamic>> subCategory) async {
    final box = getSubCategoriesBoxName();
    await box.put("list of subCategory$id", subCategory);
  }

  List<Map<String, dynamic>>? getCategory() {
    final box = getCategoriesBoxName();
    final data = box.get("list of category");
    return data != null ? List<Map<String, dynamic>>.from(data) : null;
  }

  List<Map<String, dynamic>>? getSubCategory(String id) {
    final box = getSubCategoriesBoxName();
    final data = box.get("list of subCategory$id");
    return data != null ? List<Map<String, dynamic>>.from(data) : null;
  }
}
