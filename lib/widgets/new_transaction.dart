import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key key}) : super(key: key);
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amoutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => widget.addNewTransaction(titleController.text, double.parse( amoutController.text))
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amout'),
              controller: amoutController,
              keyboardType: TextInputType.number,
              onSubmitted:  (_) => widget.addNewTransaction(titleController.text, double.parse( amoutController.text))
            ),
            FlatButton(
              textColor: Colors.purple,
              child: Text('Add Transaction'),
              onPressed: () {
                widget.addNewTransaction(titleController.text, double.parse( amoutController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
