import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  final int section_id;
  final int count;
  final String description;
  final String reference;
  final String content;

  const DataItem(
      {this.section_id,
      this.count,
      this.description,
      this.reference,
      this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(11),
      elevation: 4,
      child: Column(
        children: [
          Text(description,style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,),
            overflow: TextOverflow.visible,
          ),

        ],
      ),
    );
  }
}
