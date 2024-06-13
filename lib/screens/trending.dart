import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../consants.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {



  Widget wid3(clr){
    return   Card(
      elevation: 10,
      child: Container(
        height: 260,
        // decoration: BoxDecoration(border: Border.all(
        //     width:3,color: Colors.blue),
        //     borderRadius: BorderRadius.circular(10)
        // ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration:BoxDecoration(color: clr,),
                child: Column(
                  children: [
                    Constant.st4("01 Jun23"),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Constant.h2("  Do you know what Sequence rish is and how it can impact your finanial goals?" ),
                    ),],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 20,),
                  Constant.h2("Topic " ),
                  Constant.st4("How to pick right fundas in your app, startuo goals  The NIFTY 50 indexon average , has")

                ],
              ),
            ),
          ],
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Constant.h1("Expert Opinions"),
      bottom:PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child:Constant.h2("Latest")
        ),
      ),

      ),
      body:ListView(
        padding: EdgeInsets.all(20),
        children: [
          wid3(Colors.amberAccent[200]),
          SizedBox(height: 20,),
          wid3(Colors.deepPurpleAccent[200]),
          SizedBox(height: 20,),

          wid3(Colors.lightGreenAccent[200]),
        ],
      )
    );
  }
}
