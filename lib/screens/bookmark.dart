
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consants.dart';

class BookMArk extends StatefulWidget {
  const BookMArk({super.key});

  @override
  State<BookMArk> createState() => _BookMArkState();
}

class _BookMArkState extends State<BookMArk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Constant.h1("Your Book marks"),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Icon(Icons.hourglass_empty,color: Colors.grey,),
            Constant.st4("NO marks")
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
    );
  }
}
