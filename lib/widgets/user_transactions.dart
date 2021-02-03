import 'package:flutter/material.dart';

import 'package:expenses_planner/models/transaction.dart';

import 'package:expenses_planner/widgets/new_transaction.dart';
import 'package:expenses_planner/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> userTransactions = [
    Transaction(id: 1, title: 'New Shoes', amount: 39.99, date: DateTime.now()),
    Transaction(
        id: 2, title: 'New T-short', amount: 69.99, date: DateTime.now()),
  ];

  void addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: userTransactions.last.id++,
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction),
        TransactionList(userTransactions),
      ],
    );
  }
}
