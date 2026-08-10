//for practice purpose
import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final double amount;
  final bool isIncome;

  Transaction({
    required this.title,
    required this.amount,
    required this.isIncome,
  });
}

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  final List<Transaction> transactions = [];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  double get balance {
    double total = 0;

    for (var t in transactions) {
      if (t.isIncome) {
        total += t.amount;
      } else {
        total -= t.amount;
      }
    }

    return total;
  }

  void addTransaction(bool income) {
    final title = titleController.text.trim();
    final amount = double.tryParse(amountController.text);

    if (title.isEmpty || amount == null) return;

    setState(() {
      transactions.add(
        Transaction(
          title: title,
          amount: amount,
          isIncome: income,
        ),
      );
    });

    titleController.clear();
    amountController.clear();

    Navigator.pop(context);
  }

  void showAddDialog() {
    titleController.clear();
    amountController.clear();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Transaction"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => addTransaction(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text("Income"),
          ),
          ElevatedButton(
            onPressed: () => addTransaction(false),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text("Expense"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Income & Expense Tracker"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Current Balance",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "₹${balance.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: balance >= 0
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: transactions.isEmpty
                ? const Center(
                    child: Text(
                      "No Transactions Yet",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final item = transactions[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: item.isIncome
                                ? Colors.green
                                : Colors.red,
                            child: Icon(
                              item.isIncome
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(item.title),
                          subtitle: Text(
                            item.isIncome
                                ? "Income"
                                : "Expense",
                          ),
                          trailing: Text(
                            "${item.isIncome ? "+" : "-"} ₹${item.amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: item.isIncome
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}