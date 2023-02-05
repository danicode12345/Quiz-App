import 'package:flutter/material.dart';

class Result extends StatelessWidget {
   Result({super.key,required this.answer,required this.falses});
  final int answer;
  final int falses;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.cyan,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("waxaad saxday:  $answer",style: TextStyle(fontSize: 30),),
          SizedBox(),
          Text("waxaa qaladay: $falses",style: TextStyle(fontSize: 30),),
        ],
      )),
    );
  }
}