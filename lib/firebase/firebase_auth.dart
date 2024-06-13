import 'dart:async';
import 'package:e_learn/screens/NavScreen.dart';
import 'package:e_learn/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/usermodel.dart' as model ;
import '../util/DIalog box.dart';
import '../util/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireService{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> phoneSignup(
      BuildContext context,
      String name,
      String phoneNumber,
      ) async {

    UserCredential cred;
    TextEditingController codeController = TextEditingController();
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
         cred = await _auth.signInWithCredential(credential);

        showSnackBar(context, "Successfully logedin");
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NAvScreen()));

      },
      verificationFailed: (e) {
        showSnackBar(context, e.message!);
      },
      codeSent: ((String verificationId, int? resendToken) async {
        showOTPDialog(
          codeController: codeController,
          context: context,
          onPressed: () async {

            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: codeController.text.trim(),
            );
      cred = await _auth.signInWithCredential(credential);
            Navigator.of(context).pop();
              try {
                model.User user = model.User(
                  username: name,
                  uid: cred.user!.uid,
                   phone_no: phoneNumber,
                  interest: [],
                  bookmark: {},
                  email: '',
                  history: [],
                  progress: {"module":0},
                );
                // Remove the dialog box

                // adding user in our database
                await _firestore
                    .collection("users")
                    .doc(cred.user!.uid)
                   .set(user.toJson());
                showSnackBar(context, "Successfully logedin");
                print(_firestore.databaseId);
                // Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NAvScreen()));

            } catch (e) {
              showSnackBar(context, e.toString());
            }
          },
        );
      }),
      codeAutoRetrievalTimeout: (String verificationId) {
        //  auto retrieval timeout
      },
    );

  }

  Future<void> phoneSignIn(
      BuildContext context,
      String phoneNumber,
      ) async {
        try {
              await _auth.signInWithPhoneNumber(phoneNumber);
              showSnackBar(context, "Successfully Signed in");
              
            } catch (e) {
              showSnackBar(context, e.toString());
            }
          }

  Future<model.User> getUserData()async{
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    print(documentSnapshot.data());
    print(_firestore.collection("users").id);
    return model.User.fromSnap(documentSnapshot);
  }


  Future<List<String>> getLessons(String genre)async{

    DocumentSnapshot documentSnapshot =
    await _firestore.collection('content').doc(genre).get();
    print(documentSnapshot.id);
    print("documentSnapshot.id");
   var snapshot = documentSnapshot.data() as Map<String, dynamic>;


    return snapshot["files"];
  }



}

