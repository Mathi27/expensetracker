import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:expensetracker/widgets/new_transcation.dart';

class NewTransaction extends StatefulWidget {
  late final Function addTx;
  NewTransaction(this.addTx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  /// this function if to submit the data
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || (enteredAmount <= 0)) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: submitData,
                child: const Text(
                  "Add Transaction",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
