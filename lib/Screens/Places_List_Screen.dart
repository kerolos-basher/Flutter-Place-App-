import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/Add_New_place_Screen.dart';
import '../Screens/Places_Detail_Screen.dart';
import '../Providers/grater_place_provider.dart';

class PlacesListScreen extends StatefulWidget {
  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('All Placces'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddNewPlaseScreen.rootName);
            },
            color: Theme.of(context).accentColor,
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GratePlacesProvider>(context,listen: false).fetshPlacesData() ,
        builder: (ctx,datasnapShot)=> datasnapShot.connectionState == ConnectionState.waiting
        ? Center(child: CircularProgressIndicator(),)
        : Consumer<GratePlacesProvider>(
          child: Center(child: Text('no places added yet')),
          builder: (ctx, gratplaseprovider, ch) =>
              gratplaseprovider.items.length <= 0
                  ? ch
                  : Padding(
                      padding: EdgeInsets.all(15),
                      child: ListView.builder(
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(backgroundImage: FileImage(gratplaseprovider.items[i].image,),),
                          title: Text(gratplaseprovider.items[i].title),
                          trailing: IconButton(icon: Icon(Icons.delete),color: Theme.of(context).errorColor,onPressed: (){
                            Provider.of<GratePlacesProvider>(context,listen: false).delete(gratplaseprovider.items[i].id);
                            setState(() {
                              
                            });
                          },),
                          onTap: (){Navigator.of(context).pushNamed(PlaceDetails.roorName,arguments:gratplaseprovider.items[i].id );},
                        ),
                        itemCount: gratplaseprovider.items.length,
                      ),
                    ),
        ),
      ),
    );
  }
}
