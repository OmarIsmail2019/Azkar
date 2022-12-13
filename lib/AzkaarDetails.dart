import 'dart:convert';
import 'package:azkar/DetailsModel.dart';
import 'package:flutter/material.dart';

class AzkaarElsabah extends StatefulWidget {
final int id;
final String name;
  const AzkaarElsabah({this.id,this.name});

  @override
  State<AzkaarElsabah> createState() => _AzkaarElsabahState();

}

class _AzkaarElsabahState extends State<AzkaarElsabah> {

  List<DetailsModel> sectionDetails=[];



  void initState() {
    super.initState();
    LoadData();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    double Sized=width*0.05;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.name}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        foregroundColor: Colors.white,
      actions: [
        IconButton(onPressed: (){
          setState(() {
            Sized++;
          });
        }, icon: Icon(
          Icons.text_format,
          size: 25,
        )),
        IconButton(onPressed: (){
          setState(() {
            Sized--;
          });
        }, icon: Icon(
          Icons.text_format,
          size: 15,
        )),
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.all(5),
                  elevation: 4,
                  child: Container(
                    width: width/2,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child:Text(
                                  '${sectionDetails[index].content}',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: Sized,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  maxLines: 10,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              '${sectionDetails[index].description}',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.black,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${sectionDetails[index].count} ألعدد ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              );
            },
            separatorBuilder: (context,index)=>Divider(
              height: 1,
              indent: 1,
              color: Colors.black45,
            ),
            itemCount: sectionDetails.length),
      ),
    );
  }

  LoadData() async {
    sectionDetails=[];
    DefaultAssetBundle.of(context).loadString('assets/azkarDatabaseDetails.json').then((
        value) {
      var respone = json.decode(value);
      respone.forEach((data) {
        print(respone);
        DetailsModel _section = DetailsModel.fromJson(data);
        print(_section.content);
        if(_section.section_id==widget.id){
          sectionDetails.add(_section);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
  }
}

