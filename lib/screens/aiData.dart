import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ai extends StatefulWidget {
  const Ai({
    Key? key,
  }) : super(key: key);

  @override
  State<Ai> createState() => _Ai();
}

class _Ai extends State<Ai> {
  int eatingOut = -1;
  int tech = -1;
  int furniture = -1;
  int Other = -1;
  int cheapStuff = -1;
  int wearables = -1;

  ///split
  int HomeBills = -1;
  int SanitaryItems = -1;
  int ElecticalBill = -1;
  int GasBillHome = -1;
  int RepairsHome = -1;
  int TaxesHome = -1;

  ///split
  int Food = -1;
  int Health = -1;
  int Car = -1;
  int Cloths = -1;
  int Taxes = -1;
  int Interest = -1;

  ///split]
  int Income = -1;

  ///split
  int total = -1;
  List what = [
  "eatingOut",
  "tech",
  "furniture",
  "Other",
  "cheapStuff",
  "wearables",
  "HomeBills",
  "SanitaryItems",
  "ElecticalBill",
  "GasBillHome",
  "RepairsHome",
  "TaxesHome",
  "Food",
  "Health",
  "Car",
  "Cloths",
  "Taxes",
  "Interest"
  ];
  List workOn = ['Loading...','Loading...','Loading...'];
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
    Income = prefs.getInt('Income') ?? 0;
    if (Income < 0) {
      Income = 0;
    }
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
    total = eatingOut +
        tech +
        furniture +
        Other +
        cheapStuff +
        wearables +
        HomeBills +
        SanitaryItems +
        ElecticalBill +
        GasBillHome +
        RepairsHome +
        TaxesHome +
        Food +
        Health +
        Car +
        Cloths +
        Taxes +
        Interest;
    late List find;
    find = [
      eatingOut,
      tech,
      furniture,
      Other,
      cheapStuff,
      wearables,
      HomeBills,
      SanitaryItems,
      ElecticalBill,
      GasBillHome,
      RepairsHome,
      TaxesHome,
      Food,
      Health,
      Car,
      Cloths,
      Taxes,
      Interest
    ];
    find.sort();
    for (int i = 0; i < 3; i++) {
      for (int x = 0; x < what.length; x++) {
        int same = 0;
        same = prefs.getInt(what[x]) ?? 0;
        if (find[i] == same) {
          workOn[i] = what[x];
          find.removeAt(i);
        }
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (workOn[1] == "Loading...") {
      return Center(
        child: Column(
          children:  [
            const Spacer(),
            Text(
              workOn[1],
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ai, What Should Work On?'),
        backgroundColor: Colors.lightGreenAccent,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children:  [
            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Ai thinks that you should work on: " + workOn[0] + ", " + workOn[1] + ", and " + workOn[2],
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
