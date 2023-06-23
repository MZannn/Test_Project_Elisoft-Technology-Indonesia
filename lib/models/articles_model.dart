class ArticleModel {
  int? code;
  bool? status;
  String? message;
  List<Article>? articles;

  ArticleModel({
    this.code,
    this.status,
    this.message,
    this.articles,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
      );
}

class Article {
  String? uuid;
  String? title;
  String? content;
  String? image;
  int? views;
  Created? created;
  User? user;

  Article({
    this.uuid,
    this.title,
    this.content,
    this.image,
    this.views,
    this.created,
    this.user,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        uuid: json["uuid"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        views: json["views"],
        created:
            json["created"] == null ? null : Created.fromJson(json["created"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
}

class Created {
  String? date;
  int? timezoneType;
  String? timezone;

  Created({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: json["date"],
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );
}

class User {
  String? name;
  String? email;
  String? phoneNumber;
  Created? created;
  String? uuid;

  User({
    this.name,
    this.email,
    this.phoneNumber,
    this.created,
    this.uuid,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        created:
            json["created"] == null ? null : Created.fromJson(json["created"]),
        uuid: json["uuid"],
      );
}
