
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase/firebase_auth.dart';
import '../models/usermodel.dart';
import '../provider/user_provider.dart';

class Lessons extends StatefulWidget {
  final genre;
  const Lessons({super.key,this.genre});
  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  bool loading=false;
  List<String> lessons=[];
  final FireService _authMethods = FireService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_courses();
  }



  void get_courses() async {
    setState(() {
      loading = true;
    });

    try {
      lessons = await _authMethods.getLessons(widget.genre);
    } catch (e) {
      // Handle error gracefully
      print("Error getting lessons: $e");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    late final User user= userProvider.getUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genre),
      ),
      body:loading?CircularProgressIndicator(): ListView.builder(itemBuilder: (context,index){

        List Bmark=user.bookmark["module"];
        bool showmark=Bmark.contains(index);
        return ListTile(title: Text("Lesson $index"),
        trailing: showmark?Icon(Icons.bookmark):Icon(Icons.bookmark_border_outlined),);}),
    );
  }
}
