import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_app/models/lyrics_model.dart';
import 'package:music_app/models/track_model.dart';

import '../models/track_detail_model.dart';
import '../services/tracks_service.dart';

class Cubit {

  final TracksService _apiService = TracksService();
   Future<List<TrackListModel>> _getTrackList() async {

    List<TrackListModel> trackswithlyrics = [];
    await _apiService.getTrack().then((value) {
      log("here values are ${value.track.trackList} and ${value.track.trackList[0].has_lyrics.runtimeType}");

      for(TrackListModel model in value.track.trackList){
         trackswithlyrics.add(model);
      }
      log("here values with model is ${trackswithlyrics}");

   }).onError((error, stackTrace) {
      throw("Error is $error and $stackTrace");
    });
    return trackswithlyrics;
  }

  Future<TrackLyricModel> _getTrackLyricsData(String trackId)async {

      TrackLyricModel model = TrackLyricModel();
       await _apiService.getTrackLyrics(trackId).then((value) {
         log("here values are ${value.lyricModel.lyrics_body} ");
         model  = value.lyricModel;

       }).onError((error, stackTrace) {
         log("here i am in an error with getting lyric data $error and $stackTrace");
         throw("$error");
       });
      return model;
  }


  Future<List<TrackListModel>>getTrackListOnScreen() async {
     // await _getTrackListMap();
    return await _getTrackList();
  }


  Future<String> getLyricsBody(String trackId)async {
     String lyrics = "";
     await _getTrackLyricsData(trackId).then((value) {
       lyrics = value.lyrics_body!;
     }).onError((error, stackTrace) {
       throw("$error");
     });
     return lyrics;
  }

   Future<bool> CheckUserConnection() async {
     try {
       final result = await InternetAddress.lookup('google.com');
       bool succes = false;
       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
           succes = true;
       }
       return succes;
     } on SocketException catch (_) {
        return  false;
     }
   }





}