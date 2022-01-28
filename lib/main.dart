
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laptop_reco/screens/home.dart';
import 'package:laptop_reco/screens/lastPage.dart';
import 'package:laptop_reco/screens/loading.dart';
import 'package:laptop_reco/screens/memory.dart';
import 'package:laptop_reco/screens/os.dart';
import 'package:laptop_reco/screens/price.dart';
import 'package:laptop_reco/screens/test1.dart';
import 'package:laptop_reco/screens/type.dart';

void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

    initialRoute: '/',
    routes: {
      '/':(context) => Home(),
      '/price': (context) => Price(),
      '/type': (context) => Type(),
      '/memory': (context) => MemoryType(),
      '/os': (context) => OperatingSystem(),
      '/loading':(context) => Loading(),
      // '/test':(context) => Test(),
      '/last':(context) => LastPage(),
    }
));
}

