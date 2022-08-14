import 'dart:convert';

class Failure {
  int code;
  String message;
  Failure({
    required this.code,
    required this.message,
  });

  Failure copyWith({
    int? code,
    String? message,
  }) {
    return Failure(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'message': message});

    return result;
  }

  factory Failure.fromMap(Map<String, dynamic> map) {
    return Failure(
      code: map['code']?.toInt() ?? 0,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Failure.fromJson(String source) =>
      Failure.fromMap(json.decode(source));

  @override
  String toString() => 'Failure(code: $code, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure && other.code == code && other.message == message;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode;
}
