import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn/firebase/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  final Random _random = Random();

   final List<Color?> _colors = [
    Colors.amberAccent[200],
    Colors.deepPurpleAccent[200],
    Colors.lightGreenAccent[200]
  ];

  Color _getRandomColor() {
    return _colors[_random.nextInt(_colors.length)]!;
  }

  Widget articleCard(Map data){
    return   Card(
      elevation: 10,
      child: Expanded(

        // decoration: BoxDecoration(border: Border.all(
        //     width:3,color: Colors.blue),
        //     borderRadius: BorderRadius.circular(10)
        // ),
        child: Column(
          children: [
            Container(
              decoration:BoxDecoration(color: _getRandomColor(),),
              child: Column(
                children: [
                  // Constant.st4("${data["date"].day}/${data["date"].month}/${data["date"].year}"),
                  Constant.st4(data["date"]),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Constant.h2(data["question"]),
                  ),],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 20,),
                  Constant.h2("Topic " ),
                  Constant.st4(data["topic"])

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
      body:StreamBuilder(
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No articles found'));
          } else {
            final articles = snapshot.data!.docs;
            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                var articleData = articles[index].data() as Map<String, dynamic>;
                Color? color;
                if (index % 3 == 0) color = Colors.amberAccent[200];
                else if (index % 3 == 1) color = Colors.deepPurpleAccent[200];
                else color = Colors.lightGreenAccent[200];
                return Column(
                  children: [
                    articleCard(articleData),
                    SizedBox(height: 20),
                  ],
                );

          //   return ListView(
          //   padding: EdgeInsets.all(20),
          //   children: [
          //     wid3(Colors.amberAccent[200]),
          //     SizedBox(height: 20,),
          //     wid3(Colors.deepPurpleAccent[200]),
          //     SizedBox(height: 20,),
          //
          //     wid3(Colors.lightGreenAccent[200]),
          //   ],
          // );}

          },);}},

    stream: FirebaseFirestore.instance.collection("trending").get().asStream(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
    );
  }
}
