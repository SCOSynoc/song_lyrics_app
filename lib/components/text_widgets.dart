import 'package:flutter/cupertino.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    Key? key, required this.headName, required this.data,
  }) : super(key: key);
  final String headName;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${headName}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text("${data}",style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}