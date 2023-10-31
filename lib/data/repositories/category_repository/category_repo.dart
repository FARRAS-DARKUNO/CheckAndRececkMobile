import 'package:checking_stock/data/base/base_url.dart';
import 'package:checking_stock/data/models/category_model.dart';
import 'package:checking_stock/data/models/status_model.dart';
import 'package:dio/dio.dart';

class CategoryRepo {
  var dio = Dio();

  Future<CategoryModel> getCategory(String search) async {
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get("${baseUrl}jenis?search=$search");

      print(response.data);

      return CategoryModel.fromMap(response.data);
    } catch (_) {
      return CategoryModel(status: 'Filed', data: []);
    }
  }

  Future<StatusModel> updateCategory(int id, String name) async {
    Map data = {"id": id, "name": name};
    try {
      var response = await dio.put(
        "${baseUrl}jenis",
        data: data,
        options: Options(
          headers: {"accept": "*/*", "Content-Type": "application/json"},
        ),
      );

      return StatusModel.fromMap(response.data);
    } catch (_) {
      return StatusModel(status: "Failed");
    }
  }

  Future<StatusModel> createCategory(String name) async {
    Map data = {"name": name};
    try {
      var response = await dio.post(
        "${baseUrl}jenis",
        data: data,
        options: Options(
          headers: {"accept": "*/*", "Content-Type": "application/json"},
        ),
      );

      return StatusModel.fromMap(response.data);
    } catch (_) {
      return StatusModel(status: "Failed");
    }
  }
}
