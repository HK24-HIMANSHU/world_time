import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


 void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'berlin',flag: 'germany.png',url:'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime': instance.isDaytime,
    });


  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text('loading'),
      ),
    );
  }
}
