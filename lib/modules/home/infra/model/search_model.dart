// ignore_for_file: overridden_fields

import 'package:front_atak/modules/home/domain/entities/search_entity.dart';

class SearchModel {
  List<Body>? body;
  int? status;
  bool? successful;

  SearchModel({this.body, this.status, this.successful});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(Body.fromJson(v));
      });
    }
    status = json['status'];
    successful = json['successful'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['successful'] = successful;
    return data;
  }
}

class Body extends SearchEntity {
  @override
  String? title;
  @override
  String? link;

  Body({
    this.title,
    this.link,
  });

  Body.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['link'] = link;

    return data;
  }
}

// class SearchModel extends SearchEntity {
//   SearchModel.fromjson(Map<String, dynamic> json) {
//     title = json['title'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['title'] = title;
//     data['url'] = url;

//     return data;
//   }
// }
