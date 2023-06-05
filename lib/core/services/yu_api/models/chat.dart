import 'dart:convert';

enum ChatRole {
  ai('AI'),
  human('Human');

  final String value;
  const ChatRole(this.value);
}

class Chat {
  final ChatRole role;
  final String text;
  Chat({
    required this.role,
    required this.text,
  });

  Chat copyWith({
    ChatRole? role,
    String? text,
  }) {
    return Chat(
      role: role ?? this.role,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role.value,
      'text': text,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      role: ChatRole.values.firstWhere((e) => e.value == map['role'] as String),
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) =>
      Chat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Chat(role: $role, text: $text)';

  @override
  bool operator ==(covariant Chat other) {
    if (identical(this, other)) return true;

    return other.role == role && other.text == text;
  }

  @override
  int get hashCode => role.hashCode ^ text.hashCode;
}
