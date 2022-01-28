import 'package:flutter/material.dart';
import 'package:laptop_reco/models/laptopRec.dart';

class Type extends StatefulWidget {
  @override
  _TypeState createState() => _TypeState();
}

class _TypeState extends State<Type> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.lime[600],
          title: Text('Select Purpose',
              style: TextStyle(color: Colors.black87)),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 240, 20, 0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      LaptopRec.lType.value = 'Gaming';
                      Navigator.pushNamed(context, '/memory');
                    },
                    title: Text('Gaming',
                      textAlign: TextAlign.center,),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      LaptopRec.lType.value = 'Personal/Business';
                      Navigator.pushNamed(context, '/memory');
                    },
                    title: Text('Personal/Business',
                      textAlign: TextAlign.center,),
                  ),
                ),
              )
            ],
          ),
    );
  }
}
