import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:music_app/models/lyrics_model.dart';
import 'package:music_app/models/track_model.dart';
import 'package:http/http.dart' as http;

import '../constants/contants.dart';

class TracksService {
  Future<TrackResponseModel> getTrack() async{
    //Uri uri = Uri.parse("$url$getKeyword?format=$format&apikey=$apiKEY");
    // var client = HttpClient();
    // Uri uri = Uri.parse("https://api.musixmatch.com/ws/1.1/chart.tracks.get?format=json&apikey=f0c5ad726b347cb74a684f248740091f");
    Response responsecli;
    //response = await http.post(uri,);
    final http.Client httpClient = http.Client();
    Map<String, String> map = {
      "apikey": apiKEY,
      "format": format,
      "has_lyrics": "1"
    };

    responsecli = await httpClient.get(Uri.https(url, "$urlpath/$getKeyword", map));

    // var request = http.Request("GET", uri);
    // http.StreamedResponse response = await request.send();
    if(responsecli.statusCode == 200){
      // final responsedata = await response.stream.bytesToString();
      //log("here data in client is ${responsecli.body}");
      return TrackResponseModel.fromJson(json.decode(responsecli.body));
    }else{
      throw Exception("something went wrong");
    }
  }

  /*Future<Map<String, dynamic>> getTrackMap() async{
    Uri uri = Uri.parse("$url$getKeyword?format=$format&apikey=$apiKEY");
    //Uri uri = Uri.parse("https://api.musixmatch.com/ws/1.1/chart.tracks.get?format=json&apikey=f0c5ad726b347cb74a684f248740091f");
    Response response;

    response = await http.get(uri);
    if(response.statusCode == 200){
      log("here ${json.decode(response.body)}");
      return json.decode(response.body);
    }else{
      throw Exception("something went wrong");
    }
  }*/

  Future<GetLyricModel> getTrackLyrics(String trackId) async{
    Response response;
    final http.Client httpClient = http.Client();
    Map<String, String> map = {
      "apikey": apiKEY,
      "format": format,
      "track_id": trackId
    };

    response = await httpClient.get(Uri.https(url, "$urlpath/$getLyricsKeyword", map));
    if(response.statusCode == 200){
      //log("here log lyrics  ${json.decode(response.body)}");
      return GetLyricModel.fromJson(json.decode(response.body)) ;
    }else{
      throw Exception("something went wrong");
    }
  }

  Future<Map<String, dynamic>> getTrackdetails(String trackId) async{
    Response response;
    final http.Client httpClient = http.Client();
    Map<String, String> map = {
      "apikey": apiKEY,
      "format": format,
      "track_id": trackId
    };

    response = await httpClient.get(Uri.https(url, "$urlpath/$getTrackKeyword", map));
    if(response.statusCode == 200){
      //log("here ${json.decode(response.body)}");
      return json.decode(response.body);
    }else{
      throw Exception("something went wrong");
    }
  }



}