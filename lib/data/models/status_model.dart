import 'dart:convert';

class StatusModel {
  final String status;
  StatusModel({
    required this.status,
  });

  StatusModel copyWith({
    String? status,
  }) {
    return StatusModel(
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'status': status});
  
    return result;
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusModel.fromJson(String source) => StatusModel.fromMap(json.decode(source));

  @override
  String toString() => 'StatusModel(status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StatusModel &&
      other.status == status;
  }

  @override
  int get hashCode => status.hashCode;
}