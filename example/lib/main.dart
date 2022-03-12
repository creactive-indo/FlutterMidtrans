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
  final midpay = Midpay();

  //test payment
  _testPayment() {
    //for android auto sandbox when debug and production when release
    midpay.init("CLIENT KEY", "BASE_URL", environment: Environment.sanbox);
    midpay.setFinishCallback(_callback);
    final customer = MidtransCustomer('Nama', 'Konsumen', 'creactive-indo@gmail.com', '081234567890');
    final items = [
      MidtransItem('1', 50000, 1, 'Baby Spa Level 1')
    ];
    final total = items.map((item) => item.price).reduce((a, b) => a + b);
    final transaction = MidtransTransaction(total, customer, items, skipCustomer: true);
    midpay
      .makePayment(transaction)
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
