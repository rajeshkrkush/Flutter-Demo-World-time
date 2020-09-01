import 'package:flutter/material.dart';
import 'package:worldtime/service/word_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  void upDateTime(index) async {
    WorldTime wt = locations[index];
    print(index);
    await wt.getTime();
    Navigator.pop(context, {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDayTime': wt.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            //print('index value is $index and value is ${locations[index].location}');
            //if (index >= locations.length) index = locations.length;
            print(
                'index value is $index and value is ${locations[index].location}');
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    upDateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
