import 'package:checking_stock/data/base/base_url.dart';
import 'package:checking_stock/data/models/history_model.dart';
import 'package:checking_stock/data/models/status_model.dart';
import 'package:dio/dio.dart';

class HistoryRepo {
  var dio = Dio();

  Future<HistoryModel> getHistory(String search, String filter) async {
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response =
          await dio.get("${baseUrl}history?filter=$filter&search=$search");

      print(response.data);

      return HistoryModel.fromMap(response.data);
    } catch (_) {
      return HistoryModel(status: 'Filed', data: []);
    }
  }

  Future<StatusModel> deleteHistory(int id) async {
    try {
      var response = await dio.delete("${baseUrl}history?id=$id");

      return StatusModel.fromMap(response.data);
    } catch (_) {
      return StatusModel(status: "Failed");
    }
  }

  Future<StatusModel> createCategory(
    int jumalah,
    int idBarang,
    int idJenis,
  ) async {
    Map data = {
      "date": DateTime.now().toIso8601String(),
      "jumlah": jumalah,
      "idBarang": idBarang,
      "idJenis": idJenis
    };
    print(data);
    try {
      var response = await dio.post("${baseUrl}history", data: data);

      print("Masuk");

      return StatusModel.fromMap(response.data);
    } catch (_) {
      print("Gak masuk");

      return StatusModel(status: "Failed");
    }
  }
}
