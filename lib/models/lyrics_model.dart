import 'dart:developer';

class TrackLyricModel {
  final int? lyrics_id;
  final int? explicit;
  final String? lyrics_body;
  final String? script_tracking_url;
  final String? pixel_tracking_url;
  final String? lyrics_copyright;
  final String? updated_time;
  
  TrackLyricModel({
     this.lyrics_id,
     this.explicit,
     this.updated_time,
     this.lyrics_body,
     this.lyrics_copyright,
     this.pixel_tracking_url,
     this.script_tracking_url
    }
    );
  
  factory TrackLyricModel.fromJson(Map<String, dynamic> json) {
    return TrackLyricModel(
        lyrics_id: json["lyrics_id"],
        explicit: json["explicit"],
        updated_time: json["updated_time"],
        lyrics_body: json["lyrics_body"],
        lyrics_copyright: json["lyrics_copyright"],
        pixel_tracking_url: json["pixel_tracking_url"],
        script_tracking_url: json["script_tracking_url"]);
  }
}

class GetLyricModel {
  TrackLyricModel lyricModel;
  GetLyricModel({required this.lyricModel});
  factory GetLyricModel.fromJson(Map<String, dynamic> json) {
    return GetLyricModel(lyricModel: TrackLyricModel.fromJson(json["message"]["body"]["lyrics"]));
  }
}