// To parse this JSON data, do
//
//     final topic = topicFromJson(jsonString);

import 'dart:convert';

import 'package:domain/models/question.dart';
import 'package:domain/models/response.dart';

Topic topicFromJson(String str) => Topic.fromJson(json.decode(str));

String topicToJson(Topic data) => json.encode(data.toJson());

class Query {
  Query(this.question, this.response);

  final Question? question;
  final Response? response;
}

class Topic {
  final String? title;
  final double? createTime;
  final int? updateTime;
  final List<dynamic>? moderationResults;
  final String? currentNode;
  final dynamic pluginIds;
  final String? id;
  final List<Query>? queries;

  Topic({
    this.title,
    this.createTime,
    this.updateTime,
    this.moderationResults,
    this.currentNode,
    this.pluginIds,
    this.id,
    this.queries,
  });

  createQuery(Map<String, Map<String, dynamic>> jsonMappings) {}

  Topic copyWith(
          {String? title,
          double? createTime,
          int? updateTime,
          List<dynamic>? moderationResults,
          String? currentNode,
          dynamic pluginIds,
          String? id,
          List<Query>? queries}) =>
      Topic(
        title: title ?? this.title,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime ?? this.updateTime,
        moderationResults: moderationResults ?? this.moderationResults,
        currentNode: currentNode ?? this.currentNode,
        pluginIds: pluginIds ?? this.pluginIds,
        id: id ?? this.id,
        queries: queries ?? this.queries,
      );

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        title: json["title"],
        createTime: json["create_time"]?.toDouble(),
        updateTime: json["update_time"],
        moderationResults: json["moderation_results"] == null
            ? []
            : List<dynamic>.from(json["moderation_results"]!.map((x) => x)),
        currentNode: json["current_node"],
        pluginIds: json["plugin_ids"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "create_time": createTime,
        "update_time": updateTime,
        "moderation_results": moderationResults == null
            ? []
            : List<dynamic>.from(moderationResults!.map((x) => x)),
        "current_node": currentNode,
        "plugin_ids": pluginIds,
        "id": id,
      };
}
