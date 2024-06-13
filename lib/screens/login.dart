
import 'package:e_learn/firebase/firebase_auth.dart';
import 'package:e_learn/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'NavScreen.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool islogin=true;
  final _signInFormKey = GlobalKey<FormState>();
  bool showpass=true;
  bool login=true;
  late TextEditingController t1;
  late TextEditingController t2;
  late TextEditingController t3;

  void signUp(){
    FireService().phoneSignup(context,t1.text ,t2.text);
  }

  void signIn(){
    FireService().phoneSignIn(context,t2.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   t1 =TextEditingController();
   t2 =TextEditingController();
   t3 =TextEditingController();
  }

  @override
  void dispose() {
    t1.dispose();
    t2.dispose();
    t3.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(login?"Login":"Register"),),
      body: Center(
        child: login?SingleChildScrollView(
          child: Form(
            key: _signInFormKey,
            child: Column(
              children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Image(

                  image:  AssetImage("assets/logo.jpg")),
            ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                         islogin? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 5.0),
                            child: TextFormField(controller:t1 ,decoration: const InputDecoration(hintText: "your name"), validator: (val){
                              if(val==null|| val.isEmpty){
                                return "Enter your name";
                              }return null;

                            },),
                          ):Container(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 5.0),
                            child: TextFormField(controller:t2 ,decoration: const InputDecoration(hintText: "phone number"),
                              validator: (val){
                                if(val==null|| val.isEmpty|| val.length!=13){
                                  return "Enter your phone no";
                                }return null;},
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 5.0),
                          //   child: TextFormField(controller:t3 ,validator: (val){
                          //     if(val==null|| val.isEmpty){
                          //       return "Enter your name";
                          //     }return null;
                          //
                          //   },
                          //     obscureText: showpass,
                          //     decoration: InputDecoration(hintText: "password",
                          //         border: InputBorder.none,
                          //         suffixIcon: InkWell(
                          //             onTap: ()=>setState(() {
                          //               showpass=!showpass;
                          //             }),
                          //             child: showpass ? const Icon(Icons.remove_red_eye):const FaIcon(FontAwesomeIcons.eyeSlash,size: 20,)),
                          //         // suffixIconConstraints: BoxConstraints.loose(),
                          //
                          //         suffixIconConstraints: const BoxConstraints(maxHeight: 14),
                          //        ),
                          //   ),
                          // ),

                        ],

                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      if(_signInFormKey.currentState!.validate()){
                        signUp();
                      }
                      // Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context)=>const NAvScreen()));
                    },
                        child:  !islogin ?const Text("Login"):const Text("Register")),
                 SizedBox(width: 15,),
                  TextButton(onPressed: (){
                    setState(() {
                        islogin=!islogin;
                      });}, child:  islogin ?const Text("Login"):const Text("Register"))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircleAvatar(backgroundImage: NetworkImage("https://cdn.iconscout.com/icon/free/png-512/free-google-160-189824.png?f=webp&w=256"),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircleAvatar(backgroundImage: NetworkImage("https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/facebook-app-round-icon.png"),),
                    ),

                  ],
                )

              ],
            ),
          ),
        ):Column(
          children: [
            Card(

              child: Column(
                children: [
                  TextFormField(controller:t1 ,decoration: const InputDecoration(hintText: "phone number"),),
                  TextFormField(controller:t2 ,decoration: const InputDecoration(hintText: "password"),),

                ],

              ),
            ),
          ],
        ),

      ),
    );
  }
}
