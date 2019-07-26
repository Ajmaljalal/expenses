import 'package:flutter/material.dart';
import './widgets/transactions_list.dart';
import './widgets/new_transaction.dart';
import './modals/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'Shoping',
      amount: 89.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Car oil',
      amount: 97.99,
      date: DateTime.now(),
    ),
  ];

  _openAddNewTransactionModal (BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addNewTransaction);
    });
  }

void _addNewTransaction (String txTitle, double txAmount) {
    final newTx = Transaction(title: txTitle, amount: txAmount, id: DateTime.now().toString(), date: DateTime.now());
    setState(() {
     _transactions.add(newTx); 
    });
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('My expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _openAddNewTransactionModal(context),
              )
          ],

        ),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.purple,
                  child: Text('Chart'),
                  elevation: 5,
                ),
              ),
              TransactionList(_transactions),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: 
          FloatingActionButton(child: Icon(Icons.add),
          onPressed: () => _openAddNewTransactionModal(context),
          ),
        );
  }
}
