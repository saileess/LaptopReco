import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptop_reco/models/laptopRec.dart';
import 'package:url_launcher/url_launcher.dart';



class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  List<LaptopRec> laptops = [
    LaptopRec(laptopName: 'HP VICTUS 16.1 ', laptopRam: 'it is very nicee',
        laptopMemory: '512GB SSD', laptopOS: 'Windows', laptopType: 'Gaming', laptopPrice: 69990, laptopImage: 'hpPavilion.png'),
    LaptopRec(laptopName: 'HP 245 G7', laptopRam: 'it is very nicee',
        laptopMemory: '1TB HDD', laptopOS: 'Windows', laptopType: 'PERSONAL', laptopPrice: 29090, laptopImage: 'hpPavilion.png'),
    LaptopRec(laptopName: 'HP ZBook Studio G7', laptopRam: 'it is very nicee',
        laptopMemory: '2TB SSD', laptopOS: 'Windows', laptopType: 'PERSONAL', laptopPrice: 112980, laptopImage: 'hpPavilion.png'),
    LaptopRec(laptopName: 'HP 17 Business Laptop', laptopRam: 'it is very nicee',
        laptopMemory: '500GB SSD', laptopOS: 'LINUX', laptopType: 'BUSINESS', laptopPrice: 112285, laptopImage: 'hpPavilion.png'),
    LaptopRec(laptopName: 'MacBook Pro Core', laptopRam: 'i5 10th Gen',
        laptopMemory: '1TB SSD', laptopOS: 'Mac OS', laptopType: 'BUSINESS', laptopPrice: 174990, laptopImage: 'hpPavilion.png'),
    LaptopRec(laptopName: 'MacBook Air M1', laptopRam: 'it is very nicee',
        laptopMemory: '256GB SSD', laptopOS: 'Mac OS', laptopType: 'PERSONAL ', laptopPrice: 82990, laptopImage: 'hpPavilion.png'),
    LaptopRec(laptopName: 'Asus R541UJ-DM174', laptopRam: 'it is very nicee',
        laptopMemory: '1TB HDD', laptopOS: 'LINUX', laptopType: 'PERSONAL', laptopPrice: 41900, laptopImage: 'hpPavilion.png'),
    LaptopRec(laptopName: 'Asus ROG Strix G17', laptopRam: ' G713IH-HX020T ',
        laptopMemory: '512GB SSD', laptopOS: 'WINDOWS', laptopType: 'GAMING', laptopPrice: 70990, laptopImage: 'hpPavilion.png'),
    LaptopRec(laptopName: 'Dell Inspiron 3501', laptopRam: 'it is very nicee',
        laptopMemory: '256GB SSD', laptopOS: 'WINDOWS', laptopType: 'PERSONAL', laptopPrice: 38590, laptopImage: 'hpPavilion.png'),
    LaptopRec(laptopName: 'Dell 3478', laptopRam: 'it is very nicee',
        laptopMemory: 'ITB HDD', laptopOS: 'LINUX', laptopType: 'PERSONAL', laptopPrice: 35990, laptopImage: 'hpPavilion.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: laptops.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: 155,
                  height: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      fit: BoxFit.cover,
                      alignment: Alignment.topRight,
                      image: AssetImage('assets/hpPavilion.png'),
                    ),
                  ),
                ),
            SizedBox(width: 15),
            Container(
            // width: 200,
              height: 190,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  child: new Container(
                    padding: new EdgeInsets.symmetric(vertical: 15),
                      child: new Text(
                        laptops[index].laptopName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Container(
                  // alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                      child: Text( ' ₹' +
                          laptops[index].laptopPrice.toString() + ' ',
                        style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w400,backgroundColor: Colors.orange[300]),
                      ),
                    ),
                  ),
                SizedBox(height: 6),

                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.green,
                    ),
                    SizedBox(width: 2),
                    Container(
                      alignment: Alignment.center,
                      child: Text(laptops[index].laptopOS, // we have to display price here
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 1.2),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.green,
                    ),
                    SizedBox(width: 2),
                    Container(
                      alignment: Alignment.center,
                      child: Text(laptops[index].laptopMemory,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 1.2),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.green,
                    ),
                    SizedBox(width: 2),
                    Container(
                      // alignment: Alignment.center,
                      child: Text(laptops[index].laptopType,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 1.2),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                ElevatedButton.icon(
                  label: Text('Buy Now'),
                  onPressed: () {
                    launch('https://www.amazon.in/HP-16-1-inch-Graphics-Flicker-16-e0076AX/dp/B098QBZF1N/ref=sr_1_4?dchild=1&keywords=HP+VICTUS+16.1&qid=1633694014&sr=8-4');
                  },
                  icon: Icon(
                    Icons.shop_outlined,
                    size: 20,
                    color: Colors.black87,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue[300],
                    onPrimary: Colors.black87,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5.0),
                  ),
                ),
              ],
            ),
          ),
              ],
            ),
          );
        },
      ),
    );
  }
}
