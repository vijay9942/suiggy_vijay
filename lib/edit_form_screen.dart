import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suiggy_vijay/list_screen.dart';
import 'package:suiggy_vijay/module.dart';

import 'helper_class.dart';
import 'main.dart';

class EditSShotel extends StatefulWidget {
  const EditSShotel({Key? key}) : super(key: key);

  @override
  State<EditSShotel> createState() => _EditSShotelState();
}

class _EditSShotelState extends State<EditSShotel> {
  var _QuntatyController = TextEditingController();
  var _AmountController = TextEditingController();
  var _ProductController = TextEditingController();
  var _GstController = TextEditingController();

  var _firstTimeFlag = false;
  var _selectedId = 0;
  @override
  void initState() {
    super.initState();
  }

  _deleteFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final result = await dbHelper.delete(
                      _selectedId, DataBaseHelper.HotelDetailsTable);

                  debugPrint('-----------------> Deleted Row Id: $result');

                  if (result > 0) {
                    _showSuccessSnackBar(context, 'Deleted.');
                    Navigator.pop(context);

                    setState(() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ListScreen()));
                    });
                  }
                },
                child: Text('Delete'),
              )
            ],
            title: Text('Are you sure you want to delete this?'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_firstTimeFlag == false) {
      print('------------------> Once execute');
      _firstTimeFlag = true;

      final hotelDetails =
          ModalRoute.of(context)!.settings.arguments as HotelDetails;

      print('------------------> Received data');
      print(hotelDetails.id);
      print(hotelDetails.Quantity);
      print(hotelDetails.Amount);
      print(hotelDetails.Amount);
      print(hotelDetails.Gst);

      _selectedId = hotelDetails.id!;
      _QuntatyController.text = hotelDetails.Quantity.toString();
      _AmountController.text = hotelDetails.Amount;
      _ProductController.text = hotelDetails.Product;
      _GstController.text = hotelDetails.Gst;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("PRODUCT DETIALS"),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(value: 1, child: Text('Delete')),
            ],
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {
                print('------------------------> Delete - Display Dialog');
                _deleteFormDialog(context);
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                  controller: _QuntatyController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "enter quntaty",
                      hintText: "Enter The Quntaty")),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                  controller: _AmountController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "enter amount",
                      hintText: "Enter The Amount")),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                  controller: _ProductController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "enter product",
                      hintText: "Enter The Product")),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                  controller: _GstController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: " Gst",
                    hintText: "Enter The GST",
                  )),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  print('------->Update button clicked');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListScreen()));
                  _Update();
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _Update() async {
    print('-------------------> Update');
    print('--------------> ID: $_selectedId');
    print('-----------------> Quntaty:${_QuntatyController.text}');
    print('-----------------> Amount:${_AmountController.text}');
    print('-----------------> Product:${_ProductController.text}');
    print('-----------------> Gst:${_GstController.text}');

    Map<String, dynamic> row = {
      DataBaseHelper.columnID: _selectedId,
      DataBaseHelper.columnQuantity: _QuntatyController.text,
      DataBaseHelper.columnAmount: _AmountController.text,
      DataBaseHelper.columnProduct: _ProductController.text,
      DataBaseHelper.columnGst: _GstController.text,
    };

    final result = await dbHelper.update(row, DataBaseHelper.HotelDetailsTable);
    print('---------->Update Result:$result');

    if (result > 0) {
      Navigator.pop(context);
      _showSuccessSnackBar(context, 'Updated');
    }

    setState(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ListScreen(),
      ));
    });
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(message)));
  }
}
