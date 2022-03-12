import 'dart:async';

import 'package:flutter/material.dart';
import 'package:midpay/midpay.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final midpay = Midpay();

  //test payment
  _testPayment() {
    //for android auto sandbox when debug and production when release
    midpay.init("CLIENT KEY", "BASE_URL", environment: Environment.sanbox);
    midpay.setFinishCallback(_callback);
    var midtransCustomer = MidtransCustomer(
        'Zaki', 'Mubarok', 'creactive@gmail.com', '085704703691');
    List<MidtransItem> listitems = [];
    var midtransItems = MidtransItem('IDXXX', 50000, 2, 'Charger');
    listitems.add(midtransItems);
    var midtransTransaction = MidtransTransaction(
        100000, midtransCustomer, listitems,
        skipCustomer: true);
    midpay
        .makePayment(midtransTransaction)
        .catchError((err) => print("ERROR $err"));
  }

  //calback
  Future<void> _callback(TransactionFinished finished) async {
    print("Finish $finished");
    return Future.value(null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Midpay Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Payment"),
            onPressed: () => _testPayment(),
          ),
        ),
      ),
    );
  }
}
