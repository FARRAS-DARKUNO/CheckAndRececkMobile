import 'package:checking_stock/data/base/base_url.dart';
import 'package:checking_stock/data/models/product_model.dart';
import 'package:checking_stock/data/models/status_model.dart';
import 'package:dio/dio.dart';

class ProductRepo {
  var dio = Dio();

  Future<ProductModel> getProduct(String search) async {
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get("${baseUrl}barang?search=$search");

      print(response.data);

      return ProductModel.fromMap(response.data);
    } catch (_) {
      print("error");
      print(_);
      return ProductModel(status: 'Filed', data: []);
    }
  }

  Future<StatusModel> updateProduct(int id, String name, int stock) async {
    Map data = {"id": id, "name": name, "stock": stock};
    try {
      var response = await dio.put(
        "${baseUrl}barang",
        data: data,
        options: Options(
          headers: {"accept": "*/*", "Content-Type": "application/json"},
        ),
      );

      return StatusModel.fromMap(response.data);
    } catch (_) {
      print("error");
      print(_);
      return StatusModel(status: "Failed");
    }
  }

  Future<StatusModel> createProduct(String name, int stock) async {
    Map data = {"name": name, "stock": stock};
    try {
      var response = await dio.post(
        "${baseUrl}barang",
        data: data,
        options: Options(
          headers: {"accept": "*/*", "Content-Type": "application/json"},
        ),
      );

      return StatusModel.fromMap(response.data);
    } catch (_) {
      print("error");
      print(_);
      return StatusModel(status: "Failed");
    }
  }
}
