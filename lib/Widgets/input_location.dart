//import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:location/location.dart';


class InputLocation extends StatefulWidget {
  @override
  _InputLocationState createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
  String _previewImgUrl;
 // Future<Void> _getUserLocation() async{
  //  final datalocation =  await Location().getLocation();
  //  print(datalocation.latitude);
  //  print(datalocation.longitude);
  //}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImgUrl == null
              ? Center(
                  child: Text(
                    'no location chosen yet',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                )
              : Image.network(_previewImgUrl),
        ),
      
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(onPressed: (){} ,icon:Icon(Icons.location_on), label: Text('Curnt Locaton'),textColor: Theme.of(context).primaryColor),
            FlatButton.icon(onPressed: (){}, icon:Icon(Icons.map), label: Text(' Locaton'),textColor: Theme.of(context).primaryColor),

          ],
        )
      ],
    );
  }
}
