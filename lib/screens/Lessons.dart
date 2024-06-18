
import 'package:e_learn/firebase/firebase.dart';
import 'package:e_learn/screens/modScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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

  List lessons = [];
  bool loading = true;
  final FireService _authMethods = FireService() ;// Initialize your AuthMethods class

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  void getCourses() async {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genre),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final User user = userProvider.getUser;
              // bool showMark = user.bookmark["module"].contains(lessons[index]);

              bool showMark =  user.bookmark["module"].any((b) => mapEquals(b, lessons[index]));


              return ListTile(
                title: Text("Lesson ${lessons[index]}"),
                trailing: InkWell(
                  onTap: () async {
                    Map<String, dynamic> entireBookmark = Map.from(user.bookmark);
                    if (!showMark) {
                      entireBookmark.update("module", (val) {
                        List<dynamic> value = List.from(val);
                        value.add(lessons[index]);
                        return value;
                      });
                    } else {
                      entireBookmark.update("module", (val) {
                        List<Map> value = List.from(val);
                        value.removeWhere((b) => mapEquals(b, lessons[index]));
                        return value;

                      });
                    }
                    await OtherServices(context).updateuser(user.Updatebookmark(entireBookmark));
                    setState(() {
                      // showMark=!showMark;
                    }); // Refresh UI to reflect bookmark change
                  },
                  child: showMark
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border_outlined),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

 /*





  bool loading=true;
  List lessons=[];
  final FireService _authMethods = FireService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_courses();
  }



  void get_courses() async {


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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genre),
      ),
      body:loading?CircularProgressIndicator():Consumer<UserProvider>(
        builder: (context, userProvider, child) {
      return ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context,index){
            late final User user= userProvider.getUser;
            bool  showmark=user.bookmark["module"].contains(lessons[index]);

        return InkWell(
          onTap: (){
            OtherServices(context).createHistory("","","");
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>modScreen( url: 'https://firebasestorage.googleapis.com/v0/b/e-learn-24cce.appspot.com/o/FE_Handbook_Hindi-10-11.pdf?alt=media&token=6c92c417-8637-4664-9c5e-b373382f8f2d',)));
          },
          child: ListTile(title: Text("Lesson ${lessons[index]}"),
          trailing: InkWell(
              onTap: (){
                Map entireBmark=user.bookmark;
                if(!showmark){
                  entireBmark.update("module", (val){
                    List valu=val;
                    valu.add(lessons[index]);
                    return valu;
                  });
                  OtherServices(context).updateuser(user.Updatebookmark(entireBmark));


                }
                {
                  entireBmark.update("module", (val){
                    List valu=val;
                    valu.remove(lessons[index]);
                    return valu;
                  });
                  OtherServices(context).updateuser(user.Updatebookmark(entireBmark));
                  // user.bookmark["module"]=user.bookmark["module"].remove(lessons[index].keys.first.toString());
              }

              },
              child:showmark?Icon(Icons.bookmark):Icon(Icons.bookmark_border_outlined)
          ),),
        );});}),
    );
  }
}
*/