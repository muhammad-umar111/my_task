// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Comments {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;
  Comments({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  Comments copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return Comments(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comments.fromMap(Map<String, dynamic> map) {
    return Comments(
      postId: map['postId'] != null ? map['postId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comments.fromJson(String source) => Comments.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'comments(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(covariant Comments other) {
    if (identical(this, other)) return true;
  
    return 
      other.postId == postId &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.body == body;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;
  }
  }
