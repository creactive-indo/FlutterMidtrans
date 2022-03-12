import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mid_pay/mid_pay.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final mid_pay = Midpay();

  //test payment
  _testPayment() {
    //for android auto sandbox when debug and production when release
    mid_pay.init("CLIENT KEY", "BASE_URL", environment: Environment.sanbox);
    mid_pay.setFinishCallback(_callback);
    var midtransCustomer = MidtransCustomer(
        'Zaki', 'Mubarok', 'creactive@gmail.com', '085704703691');
    List<MidtransItem> listitems = [];
    var midtransItems = MidtransItem('IDXXX', 50000, 2, 'Charger');
    listitems.add(midtransItems);
    var midtransTransaction = MidtransTransaction(
        100000, midtransCustomer, listitems,
        skipCustomer: true);
    mid_pay
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
