import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData(){
    final enteredTitle=titleController.text;
    final enteredAmount=double.parse(amountController.text);

    if(enteredAmount<=0||enteredTitle.isEmpty)
    {
      return;
    }
            addTx(
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
