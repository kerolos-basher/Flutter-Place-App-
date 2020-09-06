import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Providers/grater_place_provider.dart';
import './Screens/Places_List_Screen.dart';
import './Screens/Add_New_place_Screen.dart';
import './Screens/Places_Detail_Screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GratePlacesProvider(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {AddNewPlaseScreen.rootName: (ctx) => AddNewPlaseScreen(),
        PlaceDetails.roorName: (ctx) => PlaceDetails()},
        
      ),
    );
  }
}
