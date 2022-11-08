import 'dart:developer';

import 'package:music_app/models/track_model.dart';

class TrackListModel {
  final int track_id;
  final String track_name;
  final List<dynamic> track_name_translation_list;
  final int track_rating;
  final int commontrack_id;
  final int instrumental;
  final int explicit;
  final int has_lyrics;
  final int has_subtitles;
  final int has_richsync;
  final int num_favourite;
  final int album_id;
  final String album_name;
  final int artist_id;
  final String artist_name;
  final String track_share_url;
  final String track_edit_url;
  final int restricted;
  final String updated_time;
  final Map<String, dynamic> primary_genres;

  TrackListModel({required this.album_id,required this.album_name,required this.artist_id,
    required this.artist_name,required this.commontrack_id,required this.explicit,required this.has_lyrics,
    required this.has_richsync,required this.instrumental,required this.has_subtitles,required this.num_favourite,
    required this.primary_genres,required this.restricted,required this.track_edit_url,required this.track_id,
    required this.track_name,required this.track_name_translation_list,
    required this.track_rating,required this.track_share_url,required this.updated_time});


  factory TrackListModel.fromJson(Map<String, dynamic> json) {
    log("Here in model class ${json["track"]["has_lyrics"]}");
    return TrackListModel(album_id: json["track"]['album_id']??0,
        album_name: json["track"]['album_name']??"",
        artist_id: json["track"]['artist_id']??0,
        artist_name: json["track"]['artist_name']??"",
        commontrack_id: json["track"]['commontrack_id']??0,
        explicit: json["track"]['explicit']??0,
        has_lyrics: json["track"]['has_lyrics']??0,
        has_richsync: json["track"]['has_richsync']??0,
        instrumental: json["track"]['instrumental']??0,
        has_subtitles: json["track"]['has_subtitles']??0, num_favourite: json["track"]['num_favourite']??0,
        primary_genres: json["track"]['primary_genres'] ?? {},
        restricted: json["track"]['restricted'] ?? 0, track_edit_url: json["track"]['track_edit_url']?? "",
        track_id: json["track"]['track_id'] ?? 0,
        track_name: json["track"]['track_name'] ?? "",
        track_name_translation_list: json["track"]['track_name_translation_list']??[],
        track_rating: json["track"]['track_rating']??0, track_share_url: json["track"]['track_share_url']?? "",
        updated_time: json["track"]['updated_time']?? ""
    );
  }


}

/*class ActualTrackModel {
  TrackListModel model;
  ActualTrackModel({required this.model});

  factory ActualTrackModel.fromJson(Map<String, dynamic> json) {
    return ActualTrackModel(model: TrackModel.fromJson(json["track_list"]["track"]));
  }
}*/
