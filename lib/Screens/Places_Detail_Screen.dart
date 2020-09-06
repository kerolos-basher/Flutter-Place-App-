import '../Providers/grater_place_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceDetails extends StatelessWidget {
   static const roorName = '/Placedetails';
  @override
  Widget build(BuildContext context) {
    final placeId = ModalRoute.of(context).settings.arguments;
    final place  = Provider.of<GratePlacesProvider>(context).getplaceId(placeId);
    return Scaffold(
      appBar: AppBar(title: Text('Place Details'),),
      body: Column(
        children: <Widget>[
           Container(
          width: double.infinity,
          height: 400,
          child: Image.file(place.image,fit: BoxFit.cover,),
          
        ),
        Text(place.title,textAlign: TextAlign.center,),
        ],
        ),
    );
  }
}