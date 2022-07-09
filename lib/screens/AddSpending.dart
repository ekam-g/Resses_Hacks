import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/coolButtion.dart';

class AddSpending extends StatefulWidget {
  const AddSpending({
    Key? key,
  }) : super(key: key);

  @override
  State<AddSpending> createState() => _AddSpending();
}

class _AddSpending extends State<AddSpending> {
  late TextEditingController incomeController;

  int HomeBills = -1;
  int SanitaryItems = -1;
  int ElecticalBill = -1;
  int GasBillHome = -1;
  int RepairsHome = -1;
  int TaxesHome = -1;
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    HomeBills = prefs.getInt('HomeBills') ?? 0;
    if (HomeBills < 0) {
      HomeBills = 0;
    }
    SanitaryItems = prefs.getInt('SanitaryItems') ?? 0;
    if (SanitaryItems < 0) {
      SanitaryItems = 0;
    }
    ElecticalBill = prefs.getInt('ElecticalBill') ?? 0;
    if (ElecticalBill < 0) {
      ElecticalBill = 0;
    }
    GasBillHome = prefs.getInt('GasBillHome') ?? 0;
    if (GasBillHome < 0) {
      GasBillHome = 0;
    }
    RepairsHome = prefs.getInt('RepairsHome') ?? 0;
    if (RepairsHome < 0) {
      RepairsHome = 0;
    }
    TaxesHome = prefs.getInt('TaxesHome') ?? 0;
    if (TaxesHome < 0) {
      TaxesHome = 0;
    }
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
    if (TaxesHome == -1) {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Home Bills is set to:  $HomeBills Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Sanitary Items is set to:  $SanitaryItems Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Electical Bill is set to:  $ElecticalBill Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Gas Bill Home is set to:  $GasBillHome Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Repairs Home is set to:  $RepairsHome Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Taxes Home is set to:  $TaxesHome Dollars',
                ),
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
                  // ExpandedButtonRow(
                  //   flex: 3,
                  //   text: 'Add',
                  //   fontSize: 15,
                  //   height: 70,
                  //   onPressed: () async {
                  //     final prefs = await SharedPreferences.getInstance();
                  //     int newData = int.parse(incomeController.text) + Income;
                  //     prefs.setInt('Income', newData);
                  //     getData();
                  //   },
                  // ),
                  // const Spacer(),
                  // ExpandedButtonRow(
                  //   flex: 3,
                  //   text: 'Subtract',
                  //   fontSize: 7,
                  //   height: 70,
                  //   onPressed: () async {
                  //     final prefs = await SharedPreferences.getInstance();
                  //     int newData = Income - int.parse(incomeController.text);
                  //     prefs.setInt('Income', newData);
                  //     getData();
                  //   },
                  // ),
                  // const Spacer(),
                  // ExpandedButtonRow(
                  //   flex: 3,
                  //   text: 'Reset',
                  //   fontSize: 9,
                  //   height: 70,
                  //   onPressed: () async {
                  //     final prefs = await SharedPreferences.getInstance();
                  //     int newData = 0;
                  //     prefs.setInt('Income', newData);
                  //     getData();
                  //   },
                  // ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              const Spacer(flex: 4)
            ],
          ),
        ),
      );
    }
  }
}
