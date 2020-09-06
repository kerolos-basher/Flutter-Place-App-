import '../models/Place.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import '../helpers/db_helper.dart';


class GratePlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void savePlaces(String pikedtitle, File pickedimg) {
    final newplace = Place(
        id: DateTime.now().toString(),
        title: pikedtitle,
        image: pickedimg,
        location: null);
    _items.add(newplace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newplace.id,
      'title': newplace.title,
      'image': newplace.image.path
    });
  }
  Place getplaceId(String id){
    return _items.firstWhere((element) => element.id == id);

  } 
  Future<void> fetshPlacesData() async
   {
    final datalist = await DBHelper.getData('user_places');
    _items = datalist
        .map((ittem) => Place(
            id: ittem['id'],
            title: ittem['title'],
            image: File(ittem['image']),
            location: null))
        .toList();
        notifyListeners();
    }
    Future<void> delete(String id) async {
     await DBHelper.delete(id,'user_places');
        notifyListeners();
    }
  
}
