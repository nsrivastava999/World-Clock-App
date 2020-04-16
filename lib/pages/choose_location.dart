import 'package:flutter/material.dart';
import 'package:com/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(url: 'America/Sao_Paulo', location: 'Rio De Janerio', flag: 'brazil.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
    WorldTime(url: 'Europe/Helsinki', location: 'Helsinki', flag: 'finland.png'),
    WorldTime(url: 'Europe/Oslo', location: 'Oslo', flag: 'norway.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Denver', location: 'Denver', flag: 'usa.png'),
  ];

  void  updateTime(index) async {
    WorldTime inst = locations[index];
    await inst.getTime();
    Navigator.pop(context, {
      'location' : inst.location,
      'flag' : inst.flag,
      'time' : inst.time,
      'isDay' : inst.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:2, horizontal: 4) ,
              child: Card(
                color: Colors.blue[500],
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                      locations[index].location,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
          itemCount: locations.length,
      ),
    );
  }
}
