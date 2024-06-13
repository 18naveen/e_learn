import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consants.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Constant.h1("Profile"),),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Padding(
              padding: const EdgeInsets.only(left: 20.0,bottom: 20,top: 20),
              child: CircleAvatar(
              radius: 70,
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("A",style: TextStyle(fontSize: 70),),
                        ),),
            ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Constant.h2("Avicii" ),
                Constant.st4("23avaci@gmail.com")
              ],
            ),
          )


          ],),
          Divider(),
          ListTile(leading: Icon(Icons.trending_up_rounded),title:Constant.h2("Progress" ), ),
          Divider(),
          ListTile(leading: Icon(Icons.settings),title:Constant.h2("Account Settings" ), ),
          Divider(),
          ListTile(leading: Icon(Icons.video_camera_back_outlined),title:Constant.h2("Videos" ), ),
          Divider(),
          ListTile(leading: Icon(Icons.read_more),title:Constant.h2("General Guidelines" ), ),
          Divider(),
          ListTile(leading: Icon(Icons.logout),title:Constant.h2("Log out" ), ),
          Divider(),
        ],
      ),

    );
  }
}
