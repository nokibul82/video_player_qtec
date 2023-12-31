import 'dart:convert';

List<VideoModel> videoModelFromJson(String str) => List<VideoModel>.from(json.decode(str).map((x) => VideoModel.fromJson(x)));

String videoModelToJson(List<VideoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoModel {
  String thumbnail;
  int id;
  String title;
  DateTime dateAndTime;
  String slug;
  DateTime createdAt;
  String manifest;
  int liveStatus;
  String? liveManifest;
  bool isLive;
  String channelImage;
  String channelName;
  String? channelUsername;
  bool isVerified;
  String channelSlug;
  String channelSubscriber;
  int channelId;
  String type;
  String viewers;
  String duration;
  ObjectType objectType;

  VideoModel({
    required this.thumbnail,
    required this.id,
    required this.title,
    required this.dateAndTime,
    required this.slug,
    required this.createdAt,
    required this.manifest,
    required this.liveStatus,
    required this.liveManifest,
    required this.isLive,
    required this.channelImage,
    required this.channelName,
    required this.channelUsername,
    required this.isVerified,
    required this.channelSlug,
    required this.channelSubscriber,
    required this.channelId,
    required this.type,
    required this.viewers,
    required this.duration,
    required this.objectType,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    thumbnail: json["thumbnail"],
    id: json["id"],
    title: json["title"],
    dateAndTime: DateTime.parse(json["date_and_time"]),
    slug: json["slug"],
    createdAt: DateTime.parse(json["created_at"]),
    manifest: json["manifest"],
    liveStatus: json["live_status"],
    liveManifest: json["live_manifest"],
    isLive: json["is_live"],
    channelImage: json["channel_image"],
    channelName: json["channel_name"],
    channelUsername: json["channel_username"],
    isVerified: json["is_verified"],
    channelSlug: json["channel_slug"],
    channelSubscriber: json["channel_subscriber"],
    channelId: json["channel_id"],
    type: json["type"],
    viewers: json["viewers"],
    duration: json["duration"],
    objectType: objectTypeValues.map[json["object_type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "id": id,
    "title": title,
    "date_and_time": dateAndTime.toIso8601String(),
    "slug": slug,
    "created_at": createdAt.toIso8601String(),
    "manifest": manifest,
    "live_status": liveStatus,
    "live_manifest": liveManifest,
    "is_live": isLive,
    "channel_image": channelImage,
    "channel_name": channelName,
    "channel_username": channelUsername,
    "is_verified": isVerified,
    "channel_slug": channelSlug,
    "channel_subscriber": channelSubscriber,
    "channel_id": channelId,
    "type": type,
    "viewers": viewers,
    "duration": duration,
    "object_type": objectTypeValues.reverse[objectType],
  };
}

enum ObjectType {
  VIDEO
}

final objectTypeValues = EnumValues({
  "video": ObjectType.VIDEO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}