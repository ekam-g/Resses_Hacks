import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/coolButtion.dart';

class Addnecessity extends StatefulWidget {
  const Addnecessity({
    Key? key,
  }) : super(key: key);

  @override
  State<Addnecessity> createState() => _Addnecessity();
}

class _Addnecessity extends State<Addnecessity> {
  late TextEditingController incomeController;

  int Food = -1;
  int Health = -1;
  int Car = -1;
  int Cloths = -1;
  int Taxes = -1;
  int Interest = -1;
  String dropdownValue = 'Food';
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Food = prefs.getInt('Food') ?? 0;
    if (Food < 0) {
      Food = 0;
    }
    Health = prefs.getInt('Health') ?? 0;
    if (Health < 0) {
      Health = 0;
    }
    Car = prefs.getInt('Car') ?? 0;
    if (Car < 0) {
      Car = 0;
    }
    Cloths = prefs.getInt('Cloths') ?? 0;
    if (Cloths < 0) {
      Cloths = 0;
    }
    Taxes = prefs.getInt('Taxes') ?? 0;
    if (Taxes < 0) {
      Taxes = 0;
    }
    Interest = prefs.getInt('Interest') ?? 0;
    if (Interest < 0) {
      Interest = 0;
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
    if (Interest == -1) {
      return Container(
          color: Colors.white,
          child: const SizedBox(
              height: 100, width: 100, child: CircularProgressIndicator()));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add Necessity Spending"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current food cost is set to:  $Food Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Health cost is set to:  $Health Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Car Bill is set to:  $Car Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Cloths cost is set to:  $Cloths Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Taxes is set to:  $Taxes Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Taxes Home is set to:  $Interest Dollars',
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(30),
                  child: TextField(
                    controller: incomeController,
                    obscureText: false,
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Change $dropdownValue',
                    ),
                  )),
              const Spacer(
                flex: 2,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.green),
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'Food',
                  'Health',
                  'Car',
                  'Cloths',
                  'Taxes',
                  'Interest',
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
                      if (dropdownValue == 'Food') {
                        int newData =
                            int.parse(incomeController.text) + Food;
                        prefs.setInt('Food', newData);
                        getData();
                      }
                      if (dropdownValue == 'Health') {
                        int newData =
                            int.parse(incomeController.text) + Health;
                        prefs.setInt('Health', newData);
                        getData();
                      }
                      if (dropdownValue == 'Car') {
                        int newData =
                            int.parse(incomeController.text) + Car;
                        prefs.setInt('Car', newData);
                        getData();
                      }
                      if (dropdownValue == 'Cloths') {
                        int newData =
                            int.parse(incomeController.text) + Cloths;
                        prefs.setInt('Cloths', newData);
                        getData();
                      }
                      if (dropdownValue == 'Taxes') {
                        int newData =
                            int.parse(incomeController.text) + Taxes;
                        prefs.setInt('Taxes', newData);
                        getData();
                      }
                      if (dropdownValue == 'Interest') {
                        int newData =
                            int.parse(incomeController.text) + Interest;
                        prefs.setInt('Interest', newData);
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
                      if (dropdownValue == 'Food') {
                        int newData =
                            Food - int.parse(incomeController.text);
                        prefs.setInt('Food', newData);
                        getData();
                      }
                      if (dropdownValue == 'Health') {
                        int newData =
                            Health - int.parse(incomeController.text);
                        prefs.setInt('Health', newData);
                        getData();
                      }
                      if (dropdownValue == 'Car') {
                        int newData =
                            Car - int.parse(incomeController.text);
                        prefs.setInt('Car', newData);
                        getData();
                      }
                      if (dropdownValue == 'Cloths') {
                        int newData =
                            Cloths - int.parse(incomeController.text);
                        prefs.setInt('Cloths', newData);
                        getData();
                      }
                      if (dropdownValue == 'Taxes') {
                        int newData =
                            Taxes - int.parse(incomeController.text);
                        prefs.setInt('Taxes', newData);
                        getData();
                      }
                      if (dropdownValue == 'Interest') {
                        int newData =
                            Interest - int.parse(incomeController.text);
                        prefs.setInt('Interest', newData);
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
                      if (dropdownValue == 'Food') {
                        prefs.setInt('Food', 0);
                        getData();
                      }
                      if (dropdownValue == 'Sanitary Items') {
                        prefs.setInt('SanitaryItems', 0);
                        getData();
                      }
                      if (dropdownValue == 'Health') {
                        prefs.setInt('Health', 0);
                        getData();
                      }
                      if (dropdownValue == 'Car') {
                        prefs.setInt('Car', 0);
                        getData();
                      }
                      if (dropdownValue == 'Taxes') {
                        prefs.setInt('Taxes', 0);
                        getData();
                      }
                      if (dropdownValue == 'Interest') {
                        prefs.setInt('Interest', 0);
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
