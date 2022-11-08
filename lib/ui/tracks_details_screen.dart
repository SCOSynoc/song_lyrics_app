import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/ui/tracks_screen.dart';

import '../components/text_widgets.dart';
import '../cubit/cubit.dart';

class TrackDetails extends StatefulWidget {
  final String? songName;
  final String? artistName;
  final String? albumName;
  final String? explicit;
  final String? rating;
  final String? trackId;

  TrackDetails({this.artistName,this.songName,this.explicit,this.rating,this.albumName,this.trackId});


  @override
  _TrackDetailsState createState() => _TrackDetailsState();
}

class _TrackDetailsState extends State<TrackDetails> {

  final Cubit _cubit = Cubit();
  String originalLyrics = "";
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getlyrisdata(widget.trackId!);
  }

  void getlyrisdata(String trackId) async{
    await _cubit.getLyricsBody(trackId).then((value){
      setState(() {
        originalLyrics = value;
        _isLoading = false;
      });
    }).onError((error, stackTrace) {
      log("here String error $error and $stackTrace");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black,)),
        backgroundColor: Colors.white,
        title: Text("Track details", style: TextStyle(color: Colors.black),),
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             TextContainer(headName: 'Name', data: '${widget.songName}',),
              TextContainer(headName: 'Artist', data: '${widget.artistName}',),
              TextContainer(headName: 'Album name', data: '${widget.albumName}',),
              TextContainer(headName: 'Explicit', data: widget.explicit == "1" ? "Yes" : "No",),
              TextContainer(headName: 'Rating', data: '${widget.rating}',),
              TextContainer(headName: 'Lyrics', data: originalLyrics.isNotEmpty ? originalLyrics : "No lyrics",),
            ],
          ),
        ),
      ),
    );
  }
}


