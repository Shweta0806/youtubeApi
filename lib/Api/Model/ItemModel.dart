// To parse this JSON data, do


import 'dart:convert';

ItemList emptyFromJson(String str) => ItemList.fromJson(json.decode(str));

String emptyToJson(ItemList data) => json.encode(data.toJson());

class ItemList {
  int statusCode;
  Data data;
  String message;
  bool success;

  ItemList({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    statusCode: json["statusCode"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
    "message": message,
    "success": success,
  };
}

class Data {
  int page;
  int limit;
  int totalPages;
  bool previousPage;
  bool nextPage;
  int totalItems;
  int currentPageItems;
  List<Datum> data;

  Data({
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.previousPage,
    required this.nextPage,
    required this.totalItems,
    required this.currentPageItems,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    previousPage: json["previousPage"],
    nextPage: json["nextPage"],
    totalItems: json["totalItems"],
    currentPageItems: json["currentPageItems"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "totalPages": totalPages,
    "previousPage": previousPage,
    "nextPage": nextPage,
    "totalItems": totalItems,
    "currentPageItems": currentPageItems,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Kind kind;
  String id;
  Snippet snippet;

  Datum({
    required this.kind,
    required this.id,
    required this.snippet,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    kind: kindValues.map[json["kind"]]!,
    id: json["id"],
    snippet: Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kindValues.reverse[kind],
    "id": id,
    "snippet": snippet.toJson(),
  };
}

enum Kind {
  YOUTUBE_PLAYLIST
}

final kindValues = EnumValues({
  "youtube#playlist": Kind.YOUTUBE_PLAYLIST
});

class Snippet {
  DateTime publishedAt;
  ChannelId channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  ChannelTitle channelTitle;
  Localized localized;

  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.localized,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: DateTime.parse(json["publishedAt"]),
    channelId: channelIdValues.map[json["channelId"]]!,
    title: json["title"],
    description: json["description"],
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: channelTitleValues.map[json["channelTitle"]]!,
    localized: Localized.fromJson(json["localized"]),
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt.toIso8601String(),
    "channelId": channelIdValues.reverse[channelId],
    "title": title,
    "description": description,
    "thumbnails": thumbnails.toJson(),
    "channelTitle": channelTitleValues.reverse[channelTitle],
    "localized": localized.toJson(),
  };
}

enum ChannelId {
  UC_XG_GY0_WKG_OZYNN_HV_SE_VM_E3_A
}

final channelIdValues = EnumValues({
  "UCXgGY0wkgOzynnHvSEVmE3A": ChannelId.UC_XG_GY0_WKG_OZYNN_HV_SE_VM_E3_A
});

enum ChannelTitle {
  HITESH_CHOUDHARY
}

final channelTitleValues = EnumValues({
  "Hitesh Choudhary": ChannelTitle.HITESH_CHOUDHARY
});

class Localized {
  String title;
  String description;

  Localized({
    required this.title,
    required this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default standard;
  Default maxres;

  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
    required this.standard,
    required this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
    standard: Default.fromJson(json["standard"]),
    maxres: Default.fromJson(json["maxres"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault.toJson(),
    "medium": medium.toJson(),
    "high": high.toJson(),
    "standard": standard.toJson(),
    "maxres": maxres.toJson(),
  };
}

class Default {
  String url;
  int width;
  int height;

  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
