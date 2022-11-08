import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/track_detail_model.dart';
import 'package:music_app/services/tracks_service.dart';
import 'package:music_app/ui/tracks_details_screen.dart';

import '../cubit/cubit.dart';

class TracksScreen extends StatefulWidget {
  const TracksScreen({Key? key}) : super(key: key);

  @override
  _TracksScreenState createState() => _TracksScreenState();
}

class _TracksScreenState extends State<TracksScreen> {

  List<TrackListModel> onScreenListModel = [];

  final Cubit _cubit = Cubit();
  bool _isInternet = false;
  bool _isLoading = true;



  @override
  void initState() {
    super.initState();
    checkConnection();
    getListon();
  }

  void getListon() async {
    await _cubit.getTrackListOnScreen().then((value) {
      setState(() {
        onScreenListModel = value;
        _isLoading = false;
      });
    });

    log("OnScreen list are $onScreenListModel");
  }

  void checkConnection() async {
     await _cubit.CheckUserConnection().then((value){
       setState(() {
         _isInternet = value;
       });
     });
  }


  @override
  Widget build(BuildContext context) {
    log("here list are $onScreenListModel");

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(child: Text("Trending", style: TextStyle(color: Colors.black),)),
      ),
      body:_isLoading ? Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: _isInternet ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _getlist(onScreenListModel)
            ],
          ): Container(
            height: MediaQuery.of(context).size.height*0.80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("No internet connection",style: TextStyle(fontSize: 15),)),
              ],
            ),
          )
        ),
      ),
    );
  }



  Container _getlist(List<TrackListModel> tracksList) {

    return Container(
     child:  ListView.builder(
         physics: const NeverScrollableScrollPhysics(),
         scrollDirection: Axis.vertical,
         shrinkWrap: true,
         itemCount: tracksList.length,
         itemBuilder: (context, index) {
       return InkWell(
         onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => TrackDetails(
             songName:tracksList[index].track_name.toString(),
             albumName: tracksList[index].album_name.toString(),
             artistName: tracksList[index].artist_name.toString(),
             rating: tracksList[index].track_rating.toString(),
             explicit: tracksList[index].explicit.toString(),
             trackId: tracksList[index].track_id.toString(),
             )
           ));
         },
         child: Container(
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(
                 color: Colors.grey.shade50,
                 width: 2.0
               )
             )
           ),
           child: ListTile(
             leading: Icon(Icons.my_library_music),
             trailing: Text(tracksList[index].artist_name.toString()),
             title: Text(tracksList[index].track_name.toString()),
             subtitle: Text(tracksList[index].album_name.toString()),
           ),
         ),
       );
     }),
    );
  }

}
