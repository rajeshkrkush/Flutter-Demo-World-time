import 'package:flutter/material.dart';
import 'package:worldtime/service/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';
  void setupWorldTime() async {
    WorldTime wt =
        WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
    await wt.getTime();
    //print(wt.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDayTime': wt.isDayTime
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
