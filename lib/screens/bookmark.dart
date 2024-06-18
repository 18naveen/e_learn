
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consants.dart';
import '../firebase/firebase.dart';
import '../models/usermodel.dart';
import '../provider/user_provider.dart';

class BookMArk extends StatefulWidget {
  const BookMArk({super.key});

  @override
  State<BookMArk> createState() => _BookMArkState();
}

class _BookMArkState extends State<BookMArk> {
  bool loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    User user = userProvider.getUser;
    return Scaffold(
      appBar: AppBar(title:  Constant.h1("Your Book marks"),),
      body: user.bookmark["module"]==[]?Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Icon(Icons.hourglass_empty,color: Colors.grey,),
            Constant.st4("NO marks")
          ],
        ),
      ):ListView.builder(
          itemCount: user.bookmark["module"].length,
          itemBuilder: (context,index)=>Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              color: Colors.white,
                child: ListTile(
              trailing: IconButton(
                icon: Icon(Icons.bookmark),
                onPressed: ()=>  showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    title: const Text("Enter OTP"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "are you sure want to delete ${user.bookmark["module"][index].toString()}"
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: Navigator.of(context).pop,
                        child: const Text("no"),
                      ),
                      TextButton(
                        onPressed: () async {
                          Map<String, dynamic> entireBookmark = Map.from(user.bookmark);
                          entireBookmark.update("module", (val) {
                            List<Map> value = List.from(val);
                            value.removeWhere((b) => mapEquals(b, user.bookmark["module"][index]));
                            return value;
                          });
                          await OtherServices(context).updateuser(user.Updatebookmark(entireBookmark));
                          Navigator.of(context).pop();

                        },
                        child: const Text("Yes"),
                      )
                    ],
                  ),
                ),
              ),
              title:Text(user.bookmark["module"][index].toString()) ,)),
          )),

    );
  }
}
