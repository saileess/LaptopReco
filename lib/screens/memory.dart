import 'package:flutter/material.dart';
import 'package:laptop_reco/models/laptopRec.dart';

class MemoryType extends StatefulWidget {
  @override
  _MemoryTypeState createState() => _MemoryTypeState();
}

class _MemoryTypeState extends State<MemoryType> {


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.blueGrey[900],
          appBar: AppBar(
            backgroundColor: Colors.lightBlue[400],
            title: Text('Select a Memory Type',
                style: TextStyle(color: Colors.black87)),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 200, 20, 0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      LaptopRec.lMemory.value = 'SSD';
                      Navigator.pushNamed(context, '/os');
                    },
                    title: Text('SSD',
                      textAlign: TextAlign.center,),
                    subtitle: Text('Solid State Drive',
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Color(0xFF480048),),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                minVerticalPadding: 8.0,
                                title: Text('Why are SSDs useful for laptops?', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        color: Color(0xFF480048))),
                                subtitle: Text("Solid state drives require less power, which translates into better battery life. While lower-priced laptops still come with traditional hard drives most midrange to high-end machines come with an SSD."
                                  "The speed difference between solid state drives vs hard drives is significant. SSDs are extremely fast in all areas, but the speed difference is more pronounced when performing certain tasks. Generally, you’ll experience much crisper gaming with an SSD. Generally, you’ll experience much crisper gaming with an SSD. "),
                                // onTap: () {
                                // Navigator.of(context).pop();
                                // setState(() {
                                // _dropDownValue = purchasedBoxes[index];
                                // });
                                // _dropdownValueChange(purchasedBoxes[index]);
                                // },
                              ),
                            );
                          }
                      );
                    },
                  );
              },
                //style: ElevatedButton.styleFrom(shape: new),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      LaptopRec.lMemory.value = 'HDD';
                      Navigator.pushNamed(context, '/os');
                    },
                    title: Text('HDD',
                      textAlign: TextAlign.center,),
                    subtitle: Text('Hard Disk Drive ',
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
              showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
              return ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Color(0xFF480048),),
              itemCount: 1,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                minVerticalPadding: 8.0,
                title: Text('Why are HDDs used in laptops?', textAlign: TextAlign.center,
                style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: Color(0xFF480048))),
                subtitle: Text('An HDD is a data storage device that lives inside the computer. It has spinning disks inside where data is stored magnetically. If you are concerned about how much information you can store on each type of drive, don’t worry. There are no differences in storage capacity. '
                    'You can get HDDs and SSDs in similar sizes. HDDs are considered a legacy technology, meaning they’ve been around longer than SSDs. In general, they are lower in cost and are practical for data that does not need to be accessed frequently.'),
                // onTap: () {
                // Navigator.of(context).pop();
                // setState(() {
                // _dropDownValue = purchasedBoxes[index];
                // });
                // _dropdownValueChange(purchasedBoxes[index]);
                // },
                ),
              );
              }
              );
              },
              );
      },
                //style: ElevatedButton.styleFrom(shape: new),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ),
            ],
          )
      );
    }
  }

