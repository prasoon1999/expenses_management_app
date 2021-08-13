// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14),
      child: ListTile(
        dense: true,
        leading: Container(
          padding: const EdgeInsets.all(8),
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(20),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('₹${transaction.amount}'),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Text(
          DateFormat('d MMM').format(transaction.date),
          style: Theme.of(context).textTheme.caption,
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                label: const Text(
                  'Remove',
                ),
                icon: const Icon(Icons.remove_circle),
                style: ButtonStyle(),
                onPressed: () => deleteTx(transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.remove_circle),
                color: Colors.grey[500],
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
