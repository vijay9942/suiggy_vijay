import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suiggy_vijay/list_screen.dart';

import 'helper_class.dart';
import 'main.dart';

class SShotel extends StatefulWidget {
  const SShotel({Key? key}) : super(key: key);

  @override
  State<SShotel> createState() => _SShotelState();
}

class _SShotelState extends State<SShotel> {
  var _QuntatyController = TextEditingController();
  var _AmountController = TextEditingController();
  var _ProductController = TextEditingController();
  var _GstController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("PRODUCT DETIALS"),
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
                  print('-------->Save button clicked');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListScreen()));
                  _save();
                },
                child: Text('save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save() async {
    print('-----------------> BankName:${_QuntatyController.text}');
    print('-----------------> BranchName:${_AmountController.text}');
    print('-----------------> Account Number:${_ProductController.text}');
    print('-----------------> IFSC Code:${_GstController.text}');

    Map<String, dynamic> row = {
      DataBaseHelper.columnQuantity: _QuntatyController.text,
      DataBaseHelper.columnAmount: _AmountController.text,
      DataBaseHelper.columnProduct: _ProductController.text,
      DataBaseHelper.columnGst: _GstController.text,
    };

    final result = await dbHelper.insert(row, DataBaseHelper.HotelDetailsTable);
    print('---------->Insert Result:$result');
    setState(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ListScreen(),
      ));
    });
  }
}
