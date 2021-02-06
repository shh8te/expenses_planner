import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses_planner/models/transaction.dart';
import 'package:expenses_planner/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      recentTransactions.forEach((element) {
        if (element.date.day == weekDay.day &&
            element.date.month == weekDay.month &&
            element.date.year == weekDay.year) {
          totalSum += element.amount;
        }
      });

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((element) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    element['day'],
                    element['amount'],
                    totalSpending == 0.0
                        ? 0.0
                        : (element['amount'] as double) / totalSpending),
              );
            }).toList(),
          ),
        ));
  }
}
