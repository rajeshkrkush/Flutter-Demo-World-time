import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;//location name in Ui
  String time; // time in that location
  String flag;//url to asset flag icon
  String url;// location url for api end point
  bool isDayTime;
  WorldTime({this.location,this.flag,this.url});
  Future<void> getTime() async{
    try{
      Response resp = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data= jsonDecode(resp.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      //print(datetime);
      //print(offset);

      // create datatime object

      DateTime dt = DateTime.parse(datetime);
      dt = dt.add(Duration(hours: int.parse(offset.substring(1,3)),minutes: int.parse(offset.substring(4,offset.length))));
      //print(dt);
      // set time property
      isDayTime= dt.hour>6 && dt.hour<20 ?true:false;
      time = DateFormat.jm().format(dt);
    }catch(e){
      print('cought an error : $e');
      time = 'Could not able to get the data';
    }

  }
}