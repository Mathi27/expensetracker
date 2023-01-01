import 'package:expensetracker/widgets/cardcontainerWidget.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/widgets/new_transcation.dart';
import 'package:expensetracker/models/transcations.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<transactions> _userTransaction = [
    // transactions(
    //   id: '01',
    //   rate: 1200,
    //   date: DateTime.now(),
    //   title: "Title One",
    // ),
    // transactions(
    //   id: '02',
    //   rate: 1400,
    //   date: DateTime.now(),
    //   title: "Title dstwo",
    // ),
  ];

  /// This is the function to pass the data to the new transaction.
  void _addNewTransaction(String txTitle, double txRate) {
    final newTx = transactions(
      id: DateTime.now().toString(),
      title: txTitle,
      rate: txRate,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          child: _userTransaction.isEmpty
              ? Column(
                  children: [
                    Text("No Transaction added yet!"),
                    Container(
                        child: Image.network(
                      "https://i.pinimg.com/originals/ce/a0/0d/cea00d5472fb477c9d2bf8724fac768d.jpg",
                      fit: BoxFit.cover,
                    ))
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 100,
                      width: double.infinity,
                      child: const Card(
                        color: Colors.blueAccent,
                        elevation: 5,
                        child: Text(
                          "CHART",
                          // style: Theme.of(context).textTheme,
                        ),
                      ),
                    ),
                    CardWidgetUi(_userTransaction),
                  ],
                ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
