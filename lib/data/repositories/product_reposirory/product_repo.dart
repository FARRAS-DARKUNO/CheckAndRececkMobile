import 'package:checking_stock/data/base/base_url.dart';
import 'package:checking_stock/data/models/product_model.dart';
// import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class ProductRepo {
  // var dio = Dio();

  Future<List<Productmodel>> getProduct(String search) async {
    // dio.options.headers['content-Type'] = 'application/json';
    // print("Loading");
    // var response = await dio.get("${baseUrl}Barang?seacrh=$search");
    // final response = await http.get(Uri.parse("${baseUrl}Barang?seacrh=$search"));
    // print(response.body);
    // List result = response.b;

    // var output = result.map((value) => Productmodel.fromMap(value)).toList();

    final response = await http.get(
      Uri.parse('http://127.0.0.1:5131/api/Barang?search=s'),
      // headers: {
      //   'Origin':
      //       'http://localhost:5173', // Sesuaikan dengan alamat yang sesuai dengan kebijakan "AllowAllOrigins"
      // },
    );

    print(response.body);

    if (response.statusCode == 200) {
      // Proses respons dengan benar
    } else {
      // Tangani kesalahan jika respons tidak berhasil
    }
    return [];
  }
}
