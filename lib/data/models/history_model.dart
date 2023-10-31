import 'dart:convert';

import 'package:flutter/foundation.dart';

class HistoryModel {
  final String status;
  final List<Data> data;
  HistoryModel({
    required this.status,
    required this.data,
  });

  HistoryModel copyWith({
    String? status,
    List<Data>? data,
  }) {
    return HistoryModel(
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

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      status: map['status'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) => HistoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'HistoryModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HistoryModel &&
      other.status == status &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  final int id_jual;
  final String name;
  final int jumlah;
  final String jenis;
  final String date;
  Data({
    required this.id_jual,
    required this.name,
    required this.jumlah,
    required this.jenis,
    required this.date,
  });

  Data copyWith({
    int? id_jual,
    String? name,
    int? jumlah,
    String? jenis,
    String? date,
  }) {
    return Data(
      id_jual: id_jual ?? this.id_jual,
      name: name ?? this.name,
      jumlah: jumlah ?? this.jumlah,
      jenis: jenis ?? this.jenis,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id_jual': id_jual});
    result.addAll({'name': name});
    result.addAll({'jumlah': jumlah});
    result.addAll({'jenis': jenis});
    result.addAll({'date': date});
  
    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id_jual: map['id_jual']?.toInt() ?? 0,
      name: map['name'] ?? '',
      jumlah: map['jumlah']?.toInt() ?? 0,
      jenis: map['jenis'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id_jual: $id_jual, name: $name, jumlah: $jumlah, jenis: $jenis, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.id_jual == id_jual &&
      other.name == name &&
      other.jumlah == jumlah &&
      other.jenis == jenis &&
      other.date == date;
  }

  @override
  int get hashCode {
    return id_jual.hashCode ^
      name.hashCode ^
      jumlah.hashCode ^
      jenis.hashCode ^
      date.hashCode;
  }
}