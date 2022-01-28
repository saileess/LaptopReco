import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laptop_reco/models/laptopRec.dart';
import 'package:url_launcher/url_launcher.dart';




class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  var sPrice;
  dynamic _collectionReference;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch(LaptopRec.lPrice.value) {
      case '1':
        _collectionReference = FirebaseFirestore.instance
            .collection('laptopfinal').where('price', isLessThan: 40000);
        break;
      case '2':
        _collectionReference = FirebaseFirestore.instance
            .collection('laptopfinal').where('price', isGreaterThan: 40000).where('price', isLessThan: 75000);
        break;
      case '3':
        _collectionReference = FirebaseFirestore.instance
            .collection('laptopfinal').where('price', isGreaterThan: 75000);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<QuerySnapshot>(
        future: _collectionReference
            .where('os', isEqualTo: LaptopRec.lOs.value)
            .where('type', isEqualTo: LaptopRec.lType.value)
            .where('memory.type', isEqualTo: LaptopRec.lMemory.value)
            .orderBy('price')
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }

          return snapshot.data.docs.length == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No results found.'),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/price');
                          },
                          child: Text('Try Again'))
                    ],
                  ),
                )
              : ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return Card(
                      elevation: 1.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 155,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                fit: BoxFit.cover,
                                alignment: Alignment.topRight,
                                image: NetworkImage(data['imgLink']),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            // width: 200,
                            height: 200,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: new Container(
                                    padding:
                                        new EdgeInsets.symmetric(vertical: 12),
                                    width: 240,
                                    child: new Text(
                                      data['name'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                Container(
                                  // alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 0),
                                    child: Text(
                                      ' ₹' + data['price'].toString() + '/-',
                                      style: TextStyle(
                                          letterSpacing: 1.25,
                                          fontSize: 18,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),

                                Row(
                                  children: [
                                    Text('•'),
                                    SizedBox(width: 2),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        data[
                                            'os'], // we have to display price here
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            letterSpacing: 1.2),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    Text('•'),
                                    SizedBox(width: 2),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${data['memory']['size']} ${data['memory']['unit']} ${data['memory']['type']}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            letterSpacing: 1.2),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    Text('•'),
                                    SizedBox(width: 2),
                                    Container(
                                      // alignment: Alignment.center,
                                      child: Text(
                                        data['type'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            letterSpacing: 1.2),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                ElevatedButton.icon(
                                  label: Text('Buy Now'),
                                  onPressed: () {
                                    launch(data['targetUrl']);
                                  },
                                  icon: Icon(
                                    Icons.shop_outlined,
                                    size: 20,
                                    color: Colors.black87,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightBlue[300],
                                    onPrimary: Colors.black87,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
        },
      ),
    );
  }
}
