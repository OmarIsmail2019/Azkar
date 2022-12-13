import 'dart:convert';
import 'package:azkar/AzkaarModel.dart';
import 'package:azkar/AzkaarDetails.dart';
import 'package:azkar/AzkarItem.dart';
import 'package:azkar/DetailsModel.dart';
import 'package:azkar/elsebha.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AzkarDataItem> section = [];

  void initState() {
    super.initState();
    LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'أذكار المسلم',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder:(context,index)=>buildItem(model: section[index]),
            itemCount: section.length,
          ),
        )
    );
  }

  Widget buildItem({@required AzkarDataItem model}) {
    return InkWell(
      onTap: (){
        if(model.id!=5){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AzkaarElsabah(id:model.id,name: model.name ,)));
        }
        else{
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Elsebha()));
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 12),
        height: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${model.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black45,
        ),
      ),
    );
  }

  LoadData() async {
    DefaultAssetBundle.of(context).loadString('assets/sections_db.json').then((
        value) {
      var respone = json.decode(value);
      respone.forEach((data) {
        AzkarDataItem _section = AzkarDataItem.fromJson(data);
        section.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
  }
}
