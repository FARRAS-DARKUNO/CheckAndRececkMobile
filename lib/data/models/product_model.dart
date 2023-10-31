import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  final String status;
  final List<Data> data;
  ProductModel({
    required this.status,
    required this.data,
  });

  ProductModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return ProductModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'status': status});
    result.addAll({'data': data.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.status == status &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final int id_barang;
  final String name;
  final int stock;
  final int min;
  final int max;
  Data({
    required this.id_barang,
    required this.name,
    required this.stock,
    required this.min,
    required this.max,
  });

  Data copyWith({
    int? id_barang,
    String? name,
    int? stock,
    int? min,
    int? max,
  }) {
    return Data(
      id_barang: id_barang ?? this.id_barang,
      name: name ?? this.name,
      stock: stock ?? this.stock,
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id_barang': id_barang});
    result.addAll({'name': name});
    result.addAll({'stock': stock});
    result.addAll({'min': min});
    result.addAll({'max': max});
  
    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id_barang: map['id_barang']?.toInt() ?? 0,
      name: map['name'] ?? '',
      stock: map['stock']?.toInt() ?? 0,
      min: map['min']?.toInt() ?? 0,
      max: map['max']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id_barang: $id_barang, name: $name, stock: $stock, min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.id_barang == id_barang &&
      other.name == name &&
      other.stock == stock &&
      other.min == min &&
      other.max == max;
  }

  @override
  int get hashCode {
    return id_barang.hashCode ^
      name.hashCode ^
      stock.hashCode ^
      min.hashCode ^
      max.hashCode;
  }
}