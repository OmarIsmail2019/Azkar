import 'package:flutter/material.dart';

class AzkarData extends StatefulWidget{
final int id;
final String name;

AzkarData(this.id, this.name);

  @override
  State<AzkarData> createState() => _AzkarDataState();
}

class _AzkarDataState extends State<AzkarData> {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){},
      child: Container(
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(widget.name, style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.red[300],
              ],
            )
        ),
      ),
    );
  }
}
