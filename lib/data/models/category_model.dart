import 'dart:convert';

class Categorymodel {
  final int id;
  final String nama;
  Categorymodel({
    required this.id,
    required this.nama,
  });

  Categorymodel copyWith({
    int? id,
    String? nama,
  }) {
    return Categorymodel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'nama': nama});
  
    return result;
  }

  factory Categorymodel.fromMap(Map<String, dynamic> map) {
    return Categorymodel(
      id: map['id']?.toInt() ?? 0,
      nama: map['nama'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorymodel.fromJson(String source) => Categorymodel.fromMap(json.decode(source));

  @override
  String toString() => 'Categorymodel(id: $id, nama: $nama)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Categorymodel &&
      other.id == id &&
      other.nama == nama;
  }

  @override
  int get hashCode => id.hashCode ^ nama.hashCode;
}