//creating a transaction model
//It is a class. A class which extends stateful or stateless widget
//is used to create widgets. This class however is just a dart class which
//acts as a blueprint for a transaction.

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
