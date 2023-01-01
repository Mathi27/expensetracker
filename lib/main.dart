import 'package:flutter/material.dart';
import 'package:expensetracker/widgets/transaction_list.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          'Expense Tracker',
          style: TextStyle(fontFamily: 'OpenSans-Bold'),
        )),
        body: TransactionList(),
      ),
    );
  }
}
