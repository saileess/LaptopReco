import 'package:flutter/material.dart';
import 'package:laptop_reco/models/laptopRec.dart';

class Price extends StatefulWidget {
  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Select a Price Range',
        style: TextStyle(color: Colors.white)),
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
                    LaptopRec.lPrice.value = '1';
                    Navigator.pushNamed(context, '/type');
                  },
                  title: Text('less than 40k',
                  textAlign: TextAlign.center,),
                ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Card(
              child: ListTile(
                onTap: () {
                  LaptopRec.lPrice.value = '2';
                  Navigator.pushNamed(context, '/type');
                },
    title: Text('from 40k to 75k',
    textAlign: TextAlign.center,),
    ),
    ),
    ),
    Container(
    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
    // height: 90,
    child: Card(
    child: ListTile(
      onTap: () {
        LaptopRec.lPrice.value = '3';
        Navigator.pushNamed(context, '/type');
      },
    title: Text('more than ₹75k',
    textAlign: TextAlign.center,),
    ),
    ),
    )
    ],
    )
    );
    }
  }

