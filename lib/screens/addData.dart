import 'package:flutter/material.dart';
import 'package:teckweek/screens/addbudget.dart';

import '../widgets/coolButtion.dart';

class AddData extends StatefulWidget {
  const AddData({
    Key? key,
  }) : super(key: key);

  @override
  State<AddData> createState() => _AddData();
}

class _AddData extends State<AddData> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data"),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            ExpandedButton(
              fontSize: 15,
              text: 'Add Budget For Month',
              flex: 2,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const addBudget()),
                );
              },
              width: 200,
              color: Colors.greenAccent,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
