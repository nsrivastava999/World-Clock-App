import 'package:flutter/material.dart';
import 'package:com/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async{
    WorldTime inst = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await inst.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : inst.location,
      'flag' : inst.flag,
      'time' : inst.time,
      'isDay' : inst.isDay,
    });

  }

  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body:Center(
        child:SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ) ,
      );
  }
}
