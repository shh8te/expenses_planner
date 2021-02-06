import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses_planner/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text('No transactions yet!'),
              SizedBox(height: 20),
              Container(
                  height: 200, child: Image.asset('assets/images/waiting.png')),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')))),
                  title: Text(
                    '${transactions[index].title}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteTransaction(transactions[index].id),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
