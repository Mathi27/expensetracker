import 'package:flutter/material.dart';

import 'package:expensetracker/models/transcations.dart';
import 'package:intl/intl.dart';

class CardWidgetUi extends StatelessWidget {
  late final List<transactions> transaction;
  CardWidgetUi(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tx) {
        return Card(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 3),
                    ),
                    child: Text(
                      "₹ :" + tx.rate.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.purple),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(DateFormat('dd-MM-yyyy').format(tx.date)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
