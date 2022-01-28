import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getData() {
    FirebaseFirestore.instance
        .collection('laptops')
        .where('os', isEqualTo: 'Windows 10').where('type', isEqualTo: 'Gaming')
        .get()
        .then((QuerySnapshot querySnapshot) {
          print(querySnapshot.docs.length);
      querySnapshot.docs.forEach((doc) {
        print(doc["name"]);
      });
    });
  }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[200],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 300, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Laptop Reco',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),),
            SizedBox(height: 25.0),
            Text(' Get quick and easy laptop recommendations..',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
            ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(45.0, 20, 40, 350),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/price'),
                // style: ElevatedButton.styleFrom(shape: new),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
              ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                ),
                // label: Text('',
                // style: TextStyle(
                //   color: Colors.black,
                // ),
                // ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
