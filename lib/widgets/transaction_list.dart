import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses_planner/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((transaction) => Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.purple, width: 2)),
                      child: Text(
                        '\$${transaction.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(transaction.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('${DateFormat.yMMMMd().format(transaction.date)}',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
