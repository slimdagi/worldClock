import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    //print(data);

    String bgImage = data['isDayTime'] ? 'dayTime.png' : 'nightTime.png';

    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.black87;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context,'/location');
                        print(result);
                        setState(() {
                          data['location'] = result['location'];
                          data['time'] = result['time'];
                          data['isDayTime'] = result['isDayTime'];
                          data['flag'] = result['flag'];
                        });

                      },
                      icon: Icon(Icons.edit_location, color: Colors.red,),
                      label: Text('Edit Location', style: TextStyle(fontSize: 20,color: Colors.white),),),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/${data['flag']}'),
                        ),
                      ),
                      Text(data['location'], style: TextStyle(fontSize: 28.0, color: Colors.white ,letterSpacing: 2)),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(data['time'], style: TextStyle(fontSize: 70, color: Colors.white),),
                ],
              ),
            ),
          )),
    );
  }
}
