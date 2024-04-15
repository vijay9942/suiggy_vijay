import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edit_form_screen.dart';
import 'helper_class.dart';
import 'main.dart';
import 'module.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<HotelDetails> _hotelDetailsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('----->initState');
    getAllHotelDetails();
  }

  getAllHotelDetails() async {
    print('method initialized');
    var hotelDetails =
        await dbHelper.queryAllRows(DataBaseHelper.HotelDetailsTable);
    hotelDetails.forEach((HotelDetailsRow) {
      setState(() {
        print('getdetailsEnterd');
        var HotelDetailsModel = HotelDetails(
            HotelDetailsRow[DataBaseHelper.columnID],
            HotelDetailsRow[DataBaseHelper.columnQuantity],
            HotelDetailsRow[DataBaseHelper.columnAmount],
            HotelDetailsRow[DataBaseHelper.columnProduct],
            HotelDetailsRow[DataBaseHelper.columnGst]);
        _hotelDetailsList.add(HotelDetailsModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: Text(
          'ORDERS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        //color: Colors.cyan,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              new Expanded(
                  child: new ListView.builder(
                      itemCount: _hotelDetailsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            print('------------> List view Clicked $index');
                            print('------------> Edit or Delete: Send Data');
                            print(_hotelDetailsList[index].id);
                            print(_hotelDetailsList[index].Quantity);
                            print(_hotelDetailsList[index].Amount);
                            print(_hotelDetailsList[index].Product);
                            print(_hotelDetailsList[index].Gst);

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditSShotel(),
                                settings: RouteSettings(
                                  arguments: _hotelDetailsList[index],
                                )));
                          },
                          child: Text(
                              _hotelDetailsList[index].Quantity.toString() +
                                  '\n' +
                                  _hotelDetailsList[index].Amount +
                                  '\n' +
                                  _hotelDetailsList[index].Product +
                                  '\n' +
                                  _hotelDetailsList[index].Gst +
                                  '\n'),
                        );
                      }))
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //    onPressed: () {

      //   },
      //  child: Icon(Icons.add),
      // ),
    );
  }
}
