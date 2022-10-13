import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transactions.dart';
import 'package:personal_expense_app/widgets/charts_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);
  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay),

        "amount": totalSum, //total amount spent in a day
      };
    }).reversed.toList();
  }

  //calculating the percentage total spending for a week
  double get totalSpending {
    return groupedTransactionsValues.fold(0.0, (sum, item) {
      return sum + (item["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(groupedTransactionsValues);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //transforming the list of maps to list of widgets
        children: groupedTransactionsValues.map((data) {
          return Container(
            padding: EdgeInsets.all(5),
            child: ChartsBar(
                label: (data["day"] as String),
                spendingAmount: (data["amount"] as double),
                spendingPctOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (data["amount"] as double) / totalSpending),
          );
        }).toList(),
      ),
    );
  }
}
