import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle=titleController.text;
    final enteredAmount=double.parse(amountController.text);

    if(enteredAmount<=0||enteredTitle.isEmpty)
    {
      return;
    }
            widget.addTx(
                   enteredTitle,
                   enteredAmount,
            );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted:(_) =>submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted:(_) =>submitData(),
                // onChanged: (val) => amtInput = val,
              ),
              FlatButton(
                onPressed: submitData,
                  // print(titleInput);
                  // print(amtInput);
                  //print(titleController.text);
                  
                  
                
                child: Text('Add Transaction'),
                textColor: Colors.purple,
              ),
            ],
          ),
        ));
  }
}
