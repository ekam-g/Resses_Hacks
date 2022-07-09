import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/DropDownMenu.dart';
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
  String dropdownValue = 'Home Bills';

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
          title: const Text("Add Home Spending"),
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
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'Home Bills',
                  'Sanitary Items',
                  'Gas Bill Home',
                  'Electrical Bill',
                  'Taxes Home',
                  'Repairs Home'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
                    fontSize: 15,
                    height: 70,
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      if (dropdownValue == 'Home Bills') {
                        int newData =
                            int.parse(incomeController.text) + HomeBills;
                        prefs.setInt('HomeBills', newData);
                        getData();
                      }
                      if (dropdownValue == 'Sanitary Items') {
                        int newData =
                            int.parse(incomeController.text) + SanitaryItems;
                        prefs.setInt('SanitaryItems', newData);
                        getData();
                      }
                      if (dropdownValue == 'Electrical Bill') {
                        int newData =
                            int.parse(incomeController.text) + ElecticalBill;
                        prefs.setInt('ElecticalBill', newData);
                        getData();
                      }
                      if (dropdownValue == 'Gas Bill Home') {
                        int newData =
                            int.parse(incomeController.text) + GasBillHome;
                        prefs.setInt('GasBillHome', newData);
                        getData();
                      }
                      if (dropdownValue == 'Repairs Home') {
                        int newData =
                            int.parse(incomeController.text) + RepairsHome;
                        prefs.setInt('RepairsHome', newData);
                        getData();
                      }
                      if (dropdownValue == 'Taxes Home') {
                        int newData =
                            int.parse(incomeController.text) + TaxesHome;
                        prefs.setInt('TaxesHome', newData);
                        getData();
                      }
                    },
                  ),
                  const Spacer(),
                  ExpandedButtonRow(
                    flex: 3,
                    text: 'Subtract',
                    fontSize: 7,
                    height: 70,
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      if (dropdownValue == 'Home Bills') {
                        int newData =
                            HomeBills - int.parse(incomeController.text);
                        prefs.setInt('HomeBills', newData);
                        getData();
                      }
                      if (dropdownValue == 'Sanitary Items') {
                        int newData =
                            SanitaryItems - int.parse(incomeController.text);
                        prefs.setInt('SanitaryItems', newData);
                        getData();
                      }
                      if (dropdownValue == 'Electrical Bill') {
                        int newData =
                            ElecticalBill - int.parse(incomeController.text);
                        prefs.setInt('ElecticalBill', newData);
                        getData();
                      }
                      if (dropdownValue == 'Gas Bill Home') {
                        int newData =
                            GasBillHome - int.parse(incomeController.text);
                        prefs.setInt('GasBillHome', newData);
                        getData();
                      }
                      if (dropdownValue == 'Repairs Home') {
                        int newData =
                            RepairsHome - int.parse(incomeController.text);
                        prefs.setInt('RepairsHome', newData);
                        getData();
                      }
                      if (dropdownValue == 'Taxes Home') {
                        int newData =
                            TaxesHome - int.parse(incomeController.text);
                        prefs.setInt('TaxesHome', newData);
                        getData();
                      }
                    },
                  ),
                  const Spacer(),
                  ExpandedButtonRow(
                    flex: 3,
                    text: 'Reset',
                    fontSize: 9,
                    height: 70,
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      if (dropdownValue == 'Home Bills') {
                        prefs.setInt('HomeBills', 0);
                        getData();
                      }
                      if (dropdownValue == 'Sanitary Items') {
                        prefs.setInt('SanitaryItems', 0);
                        getData();
                      }
                      if (dropdownValue == 'Electrical Bill') {
                        prefs.setInt('ElectricalBill', 0);
                        getData();
                      }
                      if (dropdownValue == 'Gas Bill Home') {
                        prefs.setInt('GasBillHome', 0);
                        getData();
                      }
                      if (dropdownValue == 'Repairs Home') {
                        prefs.setInt('RepairsHome', 0);
                        getData();
                      }
                      if (dropdownValue == 'Taxes Home') {
                        prefs.setInt('TaxesHome', 0);
                        getData();
                      }
                    },
                  ),
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
