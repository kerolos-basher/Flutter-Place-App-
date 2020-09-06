import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/Input_Img.dart';
import 'dart:io';
import '../Widgets/input_location.dart';
import '../Providers/grater_place_provider.dart';
class AddNewPlaseScreen extends StatefulWidget {
  static const rootName = '/AddNewPlace';
  @override
  _AddNewPlaseScreenState createState() => _AddNewPlaseScreenState();
}

class _AddNewPlaseScreenState extends State<AddNewPlaseScreen> {
  final _titleController = TextEditingController();
  File _pickedImg;
  void _selectedImg(File pickedImg)
  {
    _pickedImg = pickedImg;
  }
  void _savePlace()
  { 
    if(_titleController.text.isEmpty || _pickedImg == null)
    {
      return;
    }
    Provider.of<GratePlacesProvider>(context,listen: false).savePlaces(_titleController.text, _pickedImg);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText:'Title',),
                      controller: _titleController,
                    ),
                 SizedBox(height: 15,),
                  InputImg(_selectedImg),
                  SizedBox(height: 15,),
                  InputLocation()
                  ],
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text('AddPlace'),
            color: Theme.of(context).accentColor,
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    );
  }
}
