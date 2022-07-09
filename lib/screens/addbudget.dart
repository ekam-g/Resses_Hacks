import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/coolButtion.dart';

class addBudget extends StatefulWidget {
  const addBudget({
    Key? key,
  }) : super(key: key);

  @override
  State<addBudget> createState() => _addBudget();
}

class _addBudget extends State<addBudget> {
  late TextEditingController incomeController;

  int Income = -1;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Income = prefs.getInt('Income') ?? 0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    incomeController = TextEditingController();
  }

  @override
  void dispose() {
    incomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Income == -1) {
      return Container(
          color: Colors.white,
          child: const SizedBox(
              height: 100, width: 100, child: CircularProgressIndicator()));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add Income"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Text(
                'Current Income is set to:  $Income Dollars',
              ),
              Padding(
                  padding: const EdgeInsets.all(30),
                  child: TextField(
                    controller: incomeController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Income',
                    ),
                  )),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(
                    flex: 2,
                  ),
                  ExpandedButtonRow(
                    flex: 3,
                    text: 'Add',
                    fontSize: 20,
                    height: 70,
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      int newData = int.parse(incomeController.text) + Income;
                      prefs.setInt('Income', newData);
                      getData();
                    },
                  ),
                  const Spacer(),
                  ExpandedButtonRow(
                    flex: 3,
                    text: 'Subtract',
                    fontSize: 12,
                    height: 70,
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      int newData = Income - int.parse(incomeController.text);
                      prefs.setInt('Income', newData);
                      getData();
                    },
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              const Spacer(flex: 10,)
            ],
          ),
        ),
      );
    }
  }
}
