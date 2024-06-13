
import 'dart:ui';

import 'package:e_learn/consants.dart';
import 'package:e_learn/screens/Lessons.dart';
import 'package:e_learn/screens/modScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/usermodel.dart';
import '../provider/user_provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  Widget mod(String name,IconData icn,Color clr){
    return Card(
  elevation: 4,
  color: Colors.white,
    child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

  Expanded(
  child: Stack(
    children: [
       Container(

      decoration:  BoxDecoration(
      color: clr,
      borderRadius:const BorderRadius.only(topLeft: Radius.circular(10),
      topRight: Radius.circular(10)),

      // child: Icon(Icons.book_outlined),
  ),),

   Padding(
          padding: const EdgeInsets.only(left: 10,top: 25),
          child: Icon(icn,size: 50,weight: 5,),
          )
          ],
          ),
  ),
        Padding(
                 padding: const EdgeInsets.all(10),
                 child: Text(name,style: GoogleFonts.roboto(
                 textStyle:const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)
  ),),
  )

  ],
  ),
  );
}

  Widget Notif(String head,String body){
    return Stack(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15)),
        child: Text("New",style: TextStyle(color: Colors.white),),

      ),

      Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15)),
          child: Text("New",style: TextStyle(color: Colors.white),),

        ),
      ),
      Container(
        height: 200,
        decoration: BoxDecoration(border: Border.all(
            width:3,color: Colors.blue),
        borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
                flex:1,
                // child:Image.asset("assets/img1.jpeg")
                child:Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Image.asset("assets/logo.jpg"),
                )
            ),
            Expanded(
              child: Column(
                children: [
              Constant.h2(head),
                  Constant.st4(body)

                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
  }
  Widget wid2(){
    return   Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(15),
        height: 200,
        // decoration: BoxDecoration(border: Border.all(
        //     width:3,color: Colors.blue),
        //     borderRadius: BorderRadius.circular(10)
        // ),
        child: Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex:1,
                // child:Image.asset("assets/img1.jpeg")
                child:Padding(
                  padding: const EdgeInsets.all(17.0),
                  // child: Image.asset("assets/logo.jpg"),
                  child: Image.asset("assets/logo1.jpg"),
                )
            ),
            Expanded(
              child: Column(
                children: [
                  Constant.h2("Quick Quiz" ),
                  Constant.st4("Want to quickly know how much you understand caoital markets ? Take this quick quiz")

                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  Widget wid3(){
    return   Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(15),
        height: 200,
        // decoration: BoxDecoration(border: Border.all(
        //     width:3,color: Colors.blue),
        //     borderRadius: BorderRadius.circular(10)
        // ),
        child: Column(
          children: [
            Row(

              children: [
                Constant.h2("Level   " ),
                Constant.st4("Basic")

              ],
            ),

            Row(

              children: [
                Constant.h2("01  " ),

                Icon(Icons.bar_chart),
                Constant.h2("   Stock Market Basic" ),

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 30,),
                Constant.h2("Lesson 1" ),
                Constant.st4("Chapter 1 basics of Stocks")

              ],
            ),
          ],
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    Size Sz=MediaQuery.of(context).size;

    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final User user= userProvider.getUser;

    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        // appBar: AppBar(
        //   toolbarHeight: 70,
        //   elevation: 10,
        //   backgroundColor: Colors.grey[100],
        //   leading: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: CircleAvatar(backgroundImage: AssetImage("assets/logo.jpg")),
        //   ),
        //   title:  const Text("Ed tech"),),

        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Constant.h1("Hi ${user.username} !"),
            ),
          ),
            Notif("ED video Series", "Inroducting varsing video series for an absolute beginner . We picked essential topic from Varsity to help you get started"),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: user.history==[]? Constant.h1("Start your journey now"):Constant.h2("Continue where you left"),
              ),
            ),
            SizedBox(height: 15,),
            wid3(),
            SizedBox(height: 15,),

            SizedBox(
              height: Sz.height*0.6,
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10

                  ),
              children: [
                InkWell(
                    onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder: (contex)=> Lessons(genre: "module",))) ,
                    // onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>const modScreen())) ,
                    child: mod("Module",Icons.book_outlined,Colors.blue)),
                InkWell(
                    onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>const CommingSoon())) ,
                  child: mod("Video",Icons.video_collection_outlined,Colors.yellow[800]!)),
                InkWell(
                    onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>const CommingSoon())) ,
                  child: mod("Certified",Icons.article_outlined,Colors.deepPurple[200]!)),
                InkWell(
                    onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>const CommingSoon())) ,
                  child: mod("Junior",Icons.architecture_outlined,Colors.lightGreen)),
                InkWell(
                    onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>const CommingSoon())) ,
                child: mod("Blog",Icons.pause_presentation_sharp,Colors.pink[100]!)),

              ],

              ),
            ),
            wid2()

          ],
        ),
      ),
    );
  }
}


class CommingSoon extends StatelessWidget {
  const CommingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("COMMING SOON !"),
      ),
    );
  }
}
