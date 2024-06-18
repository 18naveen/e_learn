import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class modScreen extends StatefulWidget {
  final String url;
  const modScreen({super.key, required this.url});

  @override
  State<modScreen> createState() => _modScreenState();
}

class _modScreenState extends State<modScreen> {
  late final File pdfFile;
  bool loading =true;
  bool error =false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadPdf(widget.url);
  }

  void downloadPdf(String url) async {
    try {

      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String filePath = '${appDocDir.path}/temp.pdf';
      final File file = File(filePath);

      final Reference ref = FirebaseStorage.instance.refFromURL(url);
      final DownloadTask downloadTask = ref.writeToFile(file);

      await downloadTask;

      setState(() {
        pdfFile=file;
        loading=false;
      });

    } catch (e) {
      print(e.toString());
     setState(() {
       loading=false;
       error=true;

     });
    }}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Lesson1"),
        actions: [

          IconButton(onPressed: ()=>Navigator.of(context).pop, icon: const Icon(Icons.menu )),
          IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border_outlined )),
          IconButton(onPressed: (){}, icon: const Icon(Icons.skip_next))
        ],
      ),
      backgroundColor: Colors.blue[100],
      body: loading?CircularProgressIndicator():error?Center(
        child: Text("Error occured"),
      ):

      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ProgressBar(
              barHeight: 3,
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
              padding: EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width*0.95,
              decoration: const BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35))),
              child:
              PDFView(
                autoSpacing: true,
                enableSwipe: true,
                pageSnap: true,
                swipeHorizontal: false,
                nightMode: false,
                filePath: pdfFile.path,
              ) ,
            ),
          )

        ],
      ),

    ) ;
  }
}