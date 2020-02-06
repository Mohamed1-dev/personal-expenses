import 'package:flutter/material.dart';
import 'package:flutter_comlete_guide/widgets/transaction_item.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraint) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transactions added yet !',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset('assets/images/waiting.png'))
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map((tx) =>
                    TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                       deleteTx: deleteTx
                       )).toList());
  }
}
