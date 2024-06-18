import 'package:e_learn/provider/user_provider.dart';
import 'package:e_learn/screens/NavScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '/screens/login.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAZ2lronLBSH46jivw0FqK_EjymJduB0m8',
      appId: "1:736939890442:android:a1c3c1459d39f4031a0cf3",
    messagingSenderId: '736939890442',
      projectId: 'e-learn-24cce',
        storageBucket: "gs://e-learn-24cce.appspot.com"

    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),

      ],
      child:

      MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       home:

       StreamBuilder(
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.active) {
             // Checking if the snapshot has any data or not
             if (snapshot.hasData) {
               // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
               return NAvScreen();
             } else if (snapshot.hasError) {
               return Center(
                 child: Text('${snapshot.error}'),
               );
             }
           }

           // means connection to future hasnt been made yet
           if (snapshot.connectionState == ConnectionState.waiting) {
             return const Center(
               child: CircularProgressIndicator(),
             );
           }
           return const login();
         },
       ),


      // home: NAvScreen(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> initState() async {
    super.initState();
    if (await Permission.notification.request().isGranted) {
    // Either the permission was already granted before or the user just granted it.
    }

    Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
    ].request();
    addData();
  }

  addData() async {
    UserProvider userProvider =
    Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return  const login();

  }
}
