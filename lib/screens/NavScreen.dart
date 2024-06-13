

import 'package:e_learn/screens/Profile.dart';
import 'package:e_learn/screens/bookmark.dart';
import 'package:e_learn/screens/trending.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import 'home.dart';

class NAvScreen extends StatefulWidget {
  const NAvScreen({super.key});

  @override
  State<NAvScreen> createState() => _NAvScreenState();
}

class _NAvScreenState extends State<NAvScreen> {
  PageController pagecon=PageController();
  int currentpage=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
 getdata(){
   Provider.of<UserProvider>(context,listen: false).refreshUser();

 }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pagecon,
          children: const [
            home(),
            Trending(),
            BookMArk(),
            Profile(),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.grey,
          showUnselectedLabels: true,
            onTap: (page)=>setState(() {
              currentpage=page;
              pagecon.jumpToPage(page);

            }),
          currentIndex: currentpage,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[500],
          items: [

            BottomNavigationBarItem( icon: Icon(Icons.home),label:"Home",),
            BottomNavigationBarItem(icon: Icon(Icons.trending_up),label: "Trending",),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark_border_outlined),label: "BookMark",),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: "Profile,")

          ],
        ),

      ),
    );

  }
}
