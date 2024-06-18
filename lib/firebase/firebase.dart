

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:e_learn/models/usermodel.dart'as urs;
import '../provider/user_provider.dart';
import '../util/utils.dart';

class OtherServices {
  final BuildContext context;

  OtherServices(this.context);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  void createHistory(String no, String title, genre) async {
    final UserProvider userProvider = Provider.of<UserProvider>(context,listen: false);
    urs.User user = userProvider.getUser;

    // await _firestore.collection("users").doc(_).update({
    //   'hist': historyData
    // });
    var c = await _firestore.collection("users").doc(user.uid).get();
    Map x = c.data() as Map<String, dynamic>;
    x["history"][genre] = {"no": no, "title": title};

    await _firestore.collection("users").doc(user.uid).update({
      'history': x["history"]
    });
    userProvider.refreshUser();
  }

  void createBookMark(String no, String title, genre) async {
    final UserProvider userProvider = Provider.of<UserProvider>(context,listen: false);
    urs.User user = userProvider.getUser;

    // await _firestore.collection("users").doc(_).update({
    //   'hist': historyData
    // });
    var c = await _firestore.collection("users").doc(user.uid).get();
    Map x = c.data() as Map<String, dynamic>;
    x["bookmark"][genre].add({"no": no, "title": title});


    await _firestore.collection("users").doc(user.uid).update({
      'history': x["history"]
    });
  }

  Future<void> updateuser(urs.User usr) async {
    final UserProvider userProvider = Provider.of<UserProvider>(context,listen: false);
    urs.User user = userProvider.getUser;

    try {
      await _firestore
          .collection("users")
          .doc(usr.uid)
          .set(usr.toJson());
      showSnackBar(context, "bookmark added succesfully");
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    userProvider.refreshUser();

  }
}
