import 'dart:developer';

import 'package:music_app/models/track_detail_model.dart';

class TrackModel {
  final List<TrackListModel> trackList;
  TrackModel({required this.trackList});
  factory TrackModel.fromJson(Map<String, dynamic> json) {
    log("here in model class trackmodel is ${json["track_list"]}");
    return TrackModel(
        trackList: List<TrackListModel>.from(json["track_list"].map((x) => TrackListModel.fromJson(x)
        ).toList()
        )
    );
  }
}


class TrackResponseModel {
  final TrackModel track;
  TrackResponseModel({required this.track});
  factory TrackResponseModel.fromJson(Map<String, dynamic> json) {
    return TrackResponseModel(track: TrackModel.fromJson(json["message"]["body"]));
  }

}