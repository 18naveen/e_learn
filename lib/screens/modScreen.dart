import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class modScreen extends StatefulWidget {
  const modScreen({super.key});

  @override
  State<modScreen> createState() => _modScreenState();
}

class _modScreenState extends State<modScreen> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Lesson1"),
        actions: [

          IconButton(onPressed: (){}, icon: const Icon(Icons.menu )),
          IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border_outlined )),
          IconButton(onPressed: (){}, icon: const Icon(Icons.skip_next))
        ],
      ),
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ProgressBar(
              baseBarColor: Colors.white,
              progressBarColor: Colors.blueAccent,
              progress: Duration(milliseconds: 1000),
              buffered: Duration(milliseconds: 2000),
              total: Duration(milliseconds: 5000),
              onSeek: (duration) {
                print('User selected a new time: $duration');
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(40),
              width: MediaQuery.of(context).size.width*0.95,
              decoration: const BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))),
              child:
              Text("some contents",

                style: GoogleFonts.roboto(
                textStyle:const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)
                ),) ,
            ),
          )

        ],
      ),

    ) ;
  }
}