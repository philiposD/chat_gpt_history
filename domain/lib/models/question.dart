// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  Question({
    this.id,
    this.message,
    this.parent,
    this.children,
  });

  final String? id;
  final Message? message;
  final String? parent;
  final List<String>? children;

  String get text => message?.content?.parts?.first ?? '';

  Question copyWith({
    String? id,
    Message? message,
    String? parent,
    List<String>? children,
  }) =>
      Question(
        id: id ?? this.id,
        message: message ?? this.message,
        parent: parent ?? this.parent,
        children: children ?? this.children,
      );

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
        parent: json["parent"],
        children: json["children"] == null
            ? []
            : List<String>.from(json["children"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message?.toJson(),
        "parent": parent,
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
      };
}

class Message {
  final String? id;
  final Author? author;
  final double? createTime;
  final dynamic updateTime;
  final Content? content;
  final String? status;
  final dynamic endTurn;
  final int? weight;
  final MessageMetadata? metadata;
  final String? recipient;

  Message({
    this.id,
    this.author,
    this.createTime,
    this.updateTime,
    this.content,
    this.status,
    this.endTurn,
    this.weight,
    this.metadata,
    this.recipient,
  });

  Message copyWith({
    String? id,
    Author? author,
    double? createTime,
    dynamic updateTime,
    Content? content,
    String? status,
    dynamic endTurn,
    int? weight,
    MessageMetadata? metadata,
    String? recipient,
  }) =>
      Message(
        id: id ?? this.id,
        author: author ?? this.author,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime ?? this.updateTime,
        content: content ?? this.content,
        status: status ?? this.status,
        endTurn: endTurn ?? this.endTurn,
        weight: weight ?? this.weight,
        metadata: metadata ?? this.metadata,
        recipient: recipient ?? this.recipient,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
        createTime: json["create_time"]?.toDouble(),
        updateTime: json["update_time"],
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        status: json["status"],
        endTurn: json["end_turn"],
        weight: json["weight"],
        metadata: json["metadata"] == null
            ? null
            : MessageMetadata.fromJson(json["metadata"]),
        recipient: json["recipient"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author?.toJson(),
        "create_time": createTime,
        "update_time": updateTime,
        "content": content?.toJson(),
        "status": status,
        "end_turn": endTurn,
        "weight": weight,
        "metadata": metadata?.toJson(),
        "recipient": recipient,
      };
}

class Author {
  final String? role;
  final dynamic name;
  final AuthorMetadata? metadata;

  Author({
    this.role,
    this.name,
    this.metadata,
  });

  Author copyWith({
    String? role,
    dynamic name,
    AuthorMetadata? metadata,
  }) =>
      Author(
        role: role ?? this.role,
        name: name ?? this.name,
        metadata: metadata ?? this.metadata,
      );

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        role: json["role"],
        name: json["name"],
        metadata: json["metadata"] == null
            ? null
            : AuthorMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "name": name,
        "metadata": metadata?.toJson(),
      };
}

class AuthorMetadata {
  AuthorMetadata();

  factory AuthorMetadata.fromJson(Map<String, dynamic> json) =>
      AuthorMetadata();

  Map<String, dynamic> toJson() => {};
}

class Content {
  final String? contentType;
  final List<String>? parts;

  Content({
    this.contentType,
    this.parts,
  });

  Content copyWith({
    String? contentType,
    List<String>? parts,
  }) =>
      Content(
        contentType: contentType ?? this.contentType,
        parts: parts ?? this.parts,
      );

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        contentType: json["content_type"],
        parts: json["parts"] == null
            ? []
            : List<String>.from(json["parts"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "content_type": contentType,
        "parts": parts == null ? [] : List<dynamic>.from(parts!.map((x) => x)),
      };
}

class MessageMetadata {
  final String? timestamp;
  final dynamic messageType;

  MessageMetadata({
    this.timestamp,
    this.messageType,
  });

  MessageMetadata copyWith({
    String? timestamp,
    dynamic messageType,
  }) =>
      MessageMetadata(
        timestamp: timestamp ?? this.timestamp,
        messageType: messageType ?? this.messageType,
      );

  factory MessageMetadata.fromJson(Map<String, dynamic> json) =>
      MessageMetadata(
        timestamp: json["timestamp_"],
        messageType: json["message_type"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp_": timestamp,
        "message_type": messageType,
      };
}
