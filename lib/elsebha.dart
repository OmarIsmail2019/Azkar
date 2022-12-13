import 'package:flutter/material.dart';

class Elsebha extends StatefulWidget {

  @override
  _ElsebhaState createState() => _ElsebhaState();
}

class _ElsebhaState extends State<Elsebha> {
  var counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(
          'ألسبحة ألالكترونية',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      '${counter}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black45
                  ),
                ),
                SizedBox(height: 15,),
               Container(
                 height: 50,
                 width: 50,
                 child: MaterialButton(
                   onPressed: (){
                   setState(() {
                     counter=0;
                   });
                 },
                 ),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(50),
                   color: Colors.red,
                 ),
               ),
                SizedBox(height: 60,),
                Container(
                  height: 400,
                  width: 400,
                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        counter++;
                      });
                    },

                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(400),
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${counter}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      'مجموع ألاذكار',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
