import 'dart:convert';

class Productmodel {
  final int id;
  final String nama;
  final int stock;
  final int min;
  final int max;
  Productmodel({
    required this.id,
    required this.nama,
    required this.stock,
    required this.min,
    required this.max,
  });

  Productmodel copyWith({
    int? id,
    String? nama,
    int? stock,
    int? min,
    int? max,
  }) {
    return Productmodel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      stock: stock ?? this.stock,
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'nama': nama});
    result.addAll({'stock': stock});
    result.addAll({'min': min});
    result.addAll({'max': max});
  
    return result;
  }

  factory Productmodel.fromMap(Map<String, dynamic> map) {
    return Productmodel(
      id: map['id']?.toInt() ?? 0,
      nama: map['nama'] ?? '',
      stock: map['stock']?.toInt() ?? 0,
      min: map['min']?.toInt() ?? 0,
      max: map['max']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Productmodel.fromJson(String source) => Productmodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Productmodel(id: $id, nama: $nama, stock: $stock, min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Productmodel &&
      other.id == id &&
      other.nama == nama &&
      other.stock == stock &&
      other.min == min &&
      other.max == max;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nama.hashCode ^
      stock.hashCode ^
      min.hashCode ^
      max.hashCode;
  }
}