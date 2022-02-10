import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payhere Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Payhere Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showAlert(BuildContext context, String title, String msg) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void startOneTimePayment(BuildContext context) async {
    Map paymentObject = {
      "sandbox": true, // true if using Sandbox Merchant ID
      "merchant_id": "1211149", // Replace your Merchant ID
      "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
      "order_id": "ItemNo12345",
      "items": "Hello from Flutter!",
      "item_number_1": "001",
      "item_name_1": "Test Item #1",
      "amount_1": "15.00",
      "quantity_1": "2",
      "item_number_2": "002",
      "item_name_2": "Test Item #2",
      "amount_2": "20.00",
      "quantity_2": "1",
      "amount": 50.00,
      "currency": "LKR",
      "first_name": "HM",
      "last_name": "Badhon",
      "email": "hmbadhon@gmail.com",
      "phone": "0771234567",
      "address": "No.1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
      "delivery_address": "No. 46, Galle road, Kalutara South",
      "delivery_city": "Kalutara",
      "delivery_country": "Sri Lanka",
      "custom_1": "",
      "custom_2": ""
    };

    PayHere.startPayment(paymentObject, (paymentId) {
      log("One Time Payment Success. Payment Id: $paymentId");
      showAlert(context, "Payment Success!", "Payment Id: $paymentId");
    }, (error) {
      log("One Time Payment Failed. Error: $error");
      showAlert(context, "Payment Failed", error);
    }, () {
      log("One Time Payment Dismissed");
      showAlert(context, "Payment Dismissed", "");
    });
  }

  void startRecurringPayment(BuildContext context) async {
    Map paymentObject = {
      "sandbox": true, // true if using Sandbox Merchant ID
      "merchant_id": "1211149", // Replace your Merchant ID
      "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
      "order_id": "ItemNo12345",
      "items": "Hello from Flutter!",
      "item_number_1": "001",
      "item_name_1": "Test Item #1",
      "amount_1": 50.00,
      "quantity_1": "1",
      "item_number_2": "002",
      "item_name_2": "Test Item #1",
      "amount_2": "25.00",
      "quantity_2": "2",
      "amount": 100.00,
      "recurrence": "1 Month", // Recurring payment frequency
      "duration": "1 Year", // Recurring payment duration
      "currency": "LKR",
      "first_name": "HM",
      "last_name": "Badhon",
      "email": "hmbadhon@gmail.com",
      "phone": "0771234567",
      "address": "No.1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
      "delivery_address": "No. 46, Galle road, Kalutara South",
      "delivery_city": "Kalutara",
      "delivery_country": "Sri Lanka",
      "custom_1": "",
      "custom_2": ""
    };

    PayHere.startPayment(paymentObject, (paymentId) {
      log("Recurring Payment Success. Payment Id: $paymentId");
      showAlert(context, "Payment Success!", "Payment Id: $paymentId");
    }, (error) {
      log("Recurring Payment Failed. Error: $error");
      showAlert(context, "Payment Failed", error);
    }, () {
      log("Recurring Payment Dismissed");
      showAlert(context, "Payment Dismissed", "");
    });
  }

  void startTokenizationPayment(BuildContext context) async {
    Map paymentObject = {
      "sandbox": true, // true if using Sandbox Merchant ID
      "preapprove": true, // Required
      "merchant_id": "1211149", // Replace your Merchant ID
      "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
      "order_id": "ItemNo12345",
      "items": "Hello from Flutter!",
      "currency": "LKR",
      "first_name": "HM",
      "last_name": "Badhon",
      "email": "hmbadhon@gmail.com",
      "phone": "0771234567",
      "address": "No.1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
    };

    PayHere.startPayment(paymentObject, (paymentId) {
      log("Tokenization Payment Success. Payment Id: $paymentId");
      showAlert(context, "Payment Success!", "Payment Id: $paymentId");
    }, (error) {
      log("Tokenization Payment Failed. Error: $error");
      showAlert(context, "Payment Failed", error);
    }, () {
      log("Tokenization Payment Dismissed");
      showAlert(context, "Payment Dismissed", "");
    });
  }

  void startHoldOnCardPayment(BuildContext context) async {
    Map paymentObject = {
      "sandbox": true, // true if using Sandbox Merchant ID
      "authorize": true, // Required
      "merchant_id": "1211149", // Replace your Merchant ID
      "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
      "order_id": "ItemNo12345",
      "items": "Hello from Flutter!",
      "currency": "LKR",
      "item_number_1": "001",
      "item_name_1": "Test Item #1",
      "amount_1": "15.00",
      "quantity_1": "2",
      "item_number_2": "002",
      "item_name_2": "Test Item #2",
      "amount_2": "20.00",
      "quantity_2": "1",
      "amount": "50.00",
      "first_name": "HM",
      "last_name": "Badhon",
      "email": "hmbadhon@gmail.com",
      "phone": "0771234567",
      "address": "No.1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
    };

    PayHere.startPayment(paymentObject, (paymentId) {
      log("Hold-on-Card Payment Success.");
      showAlert(context, "Payment Success!", "");
    }, (error) {
      log("Hold-on-Card Payment Failed. Error: $error");
      showAlert(context, "Payment Failed", error);
    }, () {
      log("Hold-on-Card Payment Dismissed");
      showAlert(context, "Payment Dismissed", "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payhere Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                startOneTimePayment(context);
              },
              child: const Text(
                'Start One Time Payment!',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                startRecurringPayment(context);
              },
              child: const Text(
                'Start Recurring Payment!',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                startTokenizationPayment(context);
              },
              child: const Text(
                'Start Tokenization Payment!',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                startHoldOnCardPayment(context);
              },
              child: const Text(
                'Start Hold on Card Payment!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
