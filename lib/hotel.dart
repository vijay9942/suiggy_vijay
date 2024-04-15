import 'package:flutter/material.dart';
import 'package:suiggy_vijay/salem_rr.dart';
import 'package:suiggy_vijay/ss_hydrabad.dart';

import 'kfc.dart';

class Swiggy extends StatefulWidget {
  const Swiggy({Key? key}) : super(key: key);

  @override
  State<Swiggy> createState() => _SwiggyState();
}

class _SwiggyState extends State<Swiggy> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          'Swiggy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: Card(
                  color: Colors.orangeAccent,
                  // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 150),
                  child: ListTile(
                    leading: Icon(Icons.restaurant),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HotelSShydrabad()));
                    },
                    title: Text(
                      '            SS HYDRABAD',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: Card(
                  color: Colors.orangeAccent,
                  // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 150),
                  child: ListTile(
                    leading: Icon(Icons.restaurant),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HotelKfc()));
                    },
                    title: Text(
                      '                  KFC',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.all(3),
                  child: Card(
                    color: Colors.orangeAccent,
                    child: ListTile(
                      leading: Icon(Icons.restaurant),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HotelSalemrr()));
                      },
                      title: Text(
                        '              SALEM RR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
