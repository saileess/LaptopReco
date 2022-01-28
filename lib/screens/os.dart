import 'package:flutter/material.dart';
import 'package:laptop_reco/models/laptopRec.dart';

class OperatingSystem extends StatefulWidget {
  @override
  _OperatingSystemState createState() => _OperatingSystemState();
}

class _OperatingSystemState extends State<OperatingSystem> {
//call laptops for last screen
  List<LaptopRec> laptops = [
    LaptopRec(laptopName: 'HP pavilion', laptopRam: 'it is a very nicee',
        laptopMemory: 'SSD', laptopOS: 'Windows', laptopType: 'Gaming', laptopPrice: 63000, laptopImage: 'hpPavilion.png'),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Text('Select a Preferred OS',
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
                    LaptopRec.lOs.value = 'Windows';
                    Navigator.pushNamed(context, '/last');
                  },
                  title: Text('Windows',
                    textAlign: TextAlign.center,),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    LaptopRec.lOs.value = 'Linux';
                    Navigator.pushNamed(context, '/last');
                  },
                  title: Text('Linux / Chrome',
                    textAlign: TextAlign.center,),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    LaptopRec.lOs.value = 'Mac OS';
                    Navigator.pushNamed(context, '/last');
                  },
                  title: Text('Mac OS',
                    textAlign: TextAlign.center,),
                ),
              ),
            )
          ],
        )
    );
  }
}
