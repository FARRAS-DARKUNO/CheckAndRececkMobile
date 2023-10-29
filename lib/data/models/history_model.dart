import 'dart:convert';

class Historymodel {
  final int id;
  final String nama;
  final int jumlah;
  final String jenis;
  final String tanggal;
  Historymodel({
    required this.id,
    required this.nama,
    required this.jumlah,
    required this.jenis,
    required this.tanggal,
  });

  Historymodel copyWith({
    int? id,
    String? nama,
    int? jumlah,
    String? jenis,
    String? tanggal,
  }) {
    return Historymodel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      jumlah: jumlah ?? this.jumlah,
      jenis: jenis ?? this.jenis,
      tanggal: tanggal ?? this.tanggal,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'nama': nama});
    result.addAll({'jumlah': jumlah});
    result.addAll({'jenis': jenis});
    result.addAll({'tanggal': tanggal});
  
    return result;
  }

  factory Historymodel.fromMap(Map<String, dynamic> map) {
    return Historymodel(
      id: map['id']?.toInt() ?? 0,
      nama: map['nama'] ?? '',
      jumlah: map['jumlah']?.toInt() ?? 0,
      jenis: map['jenis'] ?? '',
      tanggal: map['tanggal'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Historymodel.fromJson(String source) => Historymodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Historymodel(id: $id, nama: $nama, jumlah: $jumlah, jenis: $jenis, tanggal: $tanggal)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Historymodel &&
      other.id == id &&
      other.nama == nama &&
      other.jumlah == jumlah &&
      other.jenis == jenis &&
      other.tanggal == tanggal;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nama.hashCode ^
      jumlah.hashCode ^
      jenis.hashCode ^
      tanggal.hashCode;
  }
}