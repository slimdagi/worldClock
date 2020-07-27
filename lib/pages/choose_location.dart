import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'agypt.png'),
    WorldTime(url: "Africa/Nairobi", location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: "America/Cancun", location: 'Cancun', flag: 'cancun.png'),
    WorldTime(url: "America/Caracas", location: 'Caracas', flag: 'caracas.png'),
    WorldTime(url: "America/Cayenne", location: 'Cayenne', flag: 'cayenne.png'),
    WorldTime(url: "Europe/Amsterdam", location: 'Amsterdam', flag: 'amsterdam.png'),
    WorldTime(url: "Europe/Andorra", location: 'Andorra', flag: 'andorra.png'),
    WorldTime(url: "Europe/Astrakhan", location: 'Astrakhan', flag: 'astrakhan.png'),
    WorldTime(url: "Europe/Athens", location: 'Athens', flag: 'athens.png'),
    WorldTime(url: "Europe/Belgrade", location: 'Belgrade', flag: 'Belgrade.png'),
    WorldTime(url: "Asia/Beirut", location: 'Beirut', flag: 'Beirut.png'),
    WorldTime(url: "Asia/Bishkek", location: 'Bishkek', flag: 'Bishkek.png'),
  ];

  void updateTime( index) async{
   WorldTime instance = locations[index];
   await instance.getTime();

   Navigator.pop(context, {
     'location':instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDayTime': instance.isDayTime
   });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Location'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),

      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
        itemCount: locations.length,),
    );
  }
}
