import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/coolButtion.dart';

class AddWaste extends StatefulWidget {
  const AddWaste({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWaste> createState() => _AddWaste();
}

class _AddWaste extends State<AddWaste> {
  late TextEditingController incomeController;

  int eatingOut = -1;
  int tech = -1;
  int furniture = -1;
  int Other = -1;
  int cheapStuff = -1;
  int wearables = -1;
  String dropdownValue = 'eatingOut';
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    eatingOut = prefs.getInt('eatingOut') ?? 0;
    if (eatingOut < 0) {
      eatingOut = 0;
    }
    tech = prefs.getInt('tech') ?? 0;
    if (tech < 0) {
      tech = 0;
    }
    furniture = prefs.getInt('furniture') ?? 0;
    if (furniture < 0) {
      furniture = 0;
    }
    Other = prefs.getInt('Other') ?? 0;
    if (Other < 0) {
      Other = 0;
    }
    cheapStuff = prefs.getInt('cheapStuff') ?? 0;
    if (cheapStuff < 0) {
      cheapStuff = 0;
    }
    wearables = prefs.getInt('wearables') ?? 0;
    if (wearables < 0) {
      wearables = 0;
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
    if (wearables == -1) {
      return Container(
          color: Colors.white,
          child: const SizedBox(
              height: 100, width: 100, child: CircularProgressIndicator()));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add Fun Spending"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current eating out cost is set to:  $eatingOut Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current tech cost is set to:  $tech Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current furniture Bill is set to:  $furniture Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Other cost is set to:  $Other Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current cheap Stuff cost is set to:  $cheapStuff Dollars',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current wearables cost is set to:  $wearables Dollars',
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
                  'eatingOut',
                  'tech',
                  'furniture',
                  'Other',
                  'cheapStuff',
                  'wearables',
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
                      if (dropdownValue == 'eatingOut') {
                        int newData =
                            int.parse(incomeController.text) + eatingOut;
                        prefs.setInt('eatingOut', newData);
                        getData();
                      }
                      if (dropdownValue == 'tech') {
                        int newData =
                            int.parse(incomeController.text) + tech;
                        prefs.setInt('tech', newData);
                        getData();
                      }
                      if (dropdownValue == 'furniture') {
                        int newData =
                            int.parse(incomeController.text) + furniture;
                        prefs.setInt('furniture', newData);
                        getData();
                      }
                      if (dropdownValue == 'Other') {
                        int newData =
                            int.parse(incomeController.text) + Other;
                        prefs.setInt('Other', newData);
                        getData();
                      }
                      if (dropdownValue == 'cheapStuff') {
                        int newData =
                            int.parse(incomeController.text) + cheapStuff;
                        prefs.setInt('cheapStuff', newData);
                        getData();
                      }
                      if (dropdownValue == 'wearables') {
                        int newData =
                            int.parse(incomeController.text) + wearables;
                        prefs.setInt('wearables', newData);
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
                      if (dropdownValue == 'eatingOut') {
                        int newData =
                            eatingOut - int.parse(incomeController.text);
                        prefs.setInt('eatingOut', newData);
                        getData();
                      }
                      if (dropdownValue == 'tech') {
                        int newData =
                            tech - int.parse(incomeController.text);
                        prefs.setInt('Health', newData);
                        getData();
                      }
                      if (dropdownValue == 'furniture') {
                        int newData =
                            furniture - int.parse(incomeController.text);
                        prefs.setInt('furniture', newData);
                        getData();
                      }
                      if (dropdownValue == 'Other') {
                        int newData =
                            Other - int.parse(incomeController.text);
                        prefs.setInt('Cloths', newData);
                        getData();
                      }
                      if (dropdownValue == 'cheapStuff') {
                        int newData =
                            cheapStuff - int.parse(incomeController.text);
                        prefs.setInt('cheapStuff', newData);
                        getData();
                      }
                      if (dropdownValue == 'wearables') {
                        int newData =
                            wearables - int.parse(incomeController.text);
                        prefs.setInt('wearables', newData);
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
                      if (dropdownValue == 'eatingOut') {
                        prefs.setInt('eatingOut', 0);
                        getData();
                      }
                      if (dropdownValue == 'tech') {
                        prefs.setInt('tech', 0);
                        getData();
                      }
                      if (dropdownValue == 'Other') {
                        prefs.setInt('Other', 0);
                        getData();
                      }
                      if (dropdownValue == 'cheapStuff') {
                        prefs.setInt('cheapStuff', 0);
                        getData();
                      }
                      if (dropdownValue == 'Taxes') {
                        prefs.setInt('Taxes', 0);
                        getData();
                      }
                      if (dropdownValue == 'wearables') {
                        prefs.setInt('wearables', 0);
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
