import 'dart:io';
import 'package:flutter/cupertino.dart';
class PlaceLocation {
  final double latitude;
  final double longtude ;
  final String address;
  PlaceLocation({@required this.latitude,@required this.longtude,this.address});
}
class Place {
 final String id;
 final String title;
 final File image;
 final  PlaceLocation location;
 Place({@required this.id,@required this.image,@required this.location,@required this.title});
}