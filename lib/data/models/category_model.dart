import 'dart:convert';

import 'package:flutter/foundation.dart';

class CategoryModel {
  final String status;
  final List<Data> data;
  CategoryModel({
    required this.status,
    required this.data,
  });

  CategoryModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return CategoryModel(
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

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryModel &&
      other.status == status &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final int id_jenis;
  final String name;
  Data({
    required this.id_jenis,
    required this.name,
  });

  Data copyWith({
    int? id_jenis,
    String? name,
  }) {
    return Data(
      id_jenis: id_jenis ?? this.id_jenis,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id_jenis': id_jenis});
    result.addAll({'name': name});
  
    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id_jenis: map['id_jenis']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(id_jenis: $id_jenis, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.id_jenis == id_jenis &&
      other.name == name;
  }

  @override
  int get hashCode => id_jenis.hashCode ^ name.hashCode;
}