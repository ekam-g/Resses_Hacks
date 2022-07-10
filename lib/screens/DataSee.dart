import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeeData extends StatefulWidget {
  const SeeData({
    Key? key,
  }) : super(key: key);

  @override
  State<SeeData> createState() => _SeeData();
}

class _SeeData extends State<SeeData> {
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
  late int total;
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
    total = eatingOut + tech + furniture + Other + cheapStuff + wearables + HomeBills + SanitaryItems + ElecticalBill + GasBillHome + RepairsHome + TaxesHome + Food + Health + Car + Cloths + Taxes + Interest + Income;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (Income == 0) {
      return  Center(
        child: Column(
          children: const [
            Spacer(),
            Text('Please Add More Data', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            CircularProgressIndicator(),
            Spacer(),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ListTile(
              title: const Text('Total Spending'),
              tileColor: Colors.green[200],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data:  [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': 'Total Fun\$', 'measure': eatingOut + tech + furniture + Other + cheapStuff + wearables},
                        {'domain': 'Total Necessary\$', 'measure': Food + Health + Car + Cloths + Taxes + Interest},
                        {'domain': 'Total House\$', 'measure': HomeBills + ElecticalBill + SanitaryItems + RepairsHome + GasBillHome + TaxesHome},
                        {'domain': 'Income', 'measure': Income},
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 5,
                  axisLinePointWidth: 2,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.green,
                  showBarValue: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data:  [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': 'Total Fun\$', 'measure': eatingOut + tech + furniture + Other + cheapStuff + wearables},
                        {'domain': 'Total Necessary\$', 'measure': Food + Health + Car + Cloths + Taxes + Interest},
                        {'domain': 'Total House\$', 'measure': HomeBills + ElecticalBill + SanitaryItems + RepairsHome + GasBillHome + TaxesHome},
                        {'domain': 'Income', 'measure': Income},
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.green,
                  verticalDirection: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data:  [
                    {'domain': 'Total Fun \$', 'measure': eatingOut + tech + furniture + Other + cheapStuff + wearables},
                    {'domain': 'Total Necessary \$', 'measure': Food + Health + Car + Cloths + Taxes + Interest},
                    {'domain': 'Total House \$', 'measure': HomeBills + ElecticalBill + SanitaryItems + RepairsHome + GasBillHome + TaxesHome},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Total Fun \$':
                        return Colors.orange;
                      case 'Total House \$':
                        return Colors.blue;
                      case 'Total Necessary \$':
                        return Colors.green;
                      default:
                        return Colors.orange;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}:\n${pieData['measure']}\$";
                  },
                  labelPosition: PieLabelPosition.outside,
                ),
              ),
            ),
            ListTile(
              title: const Text('Fun Spending'),
              tileColor: Colors.green[200],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data:  [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': 'eating out\$', 'measure': eatingOut},
                        {'domain': 'tech\$', 'measure': tech},
                        {'domain': 'furniture\$', 'measure': furniture},
                        {'domain': 'Other', 'measure': Other},
                        {'domain': 'cheapStuff', 'measure': cheapStuff},
                        {'domain': 'wearables', 'measure': wearables},

                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 5,
                  axisLinePointWidth: 2,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.green,
                  showBarValue: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data:  [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': 'eating out\$', 'measure': eatingOut},
                        {'domain': 'tech\$', 'measure': tech},
                        {'domain': 'furniture\$', 'measure': furniture},
                        {'domain': 'Other', 'measure': Other},
                        {'domain': 'cheapStuff', 'measure': cheapStuff},
                        {'domain': 'wearables', 'measure': wearables},
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.green,
                  verticalDirection: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data:  [
                    {'domain': 'eating out\$', 'measure': eatingOut},
                    {'domain': 'tech\$', 'measure': tech},
                    {'domain': 'furniture\$', 'measure': furniture},
                    {'domain': 'Other', 'measure': Other},
                    {'domain': 'cheapStuff', 'measure': cheapStuff},
                    {'domain': 'wearables', 'measure': wearables},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Total Fun \$':
                        return Colors.orange;
                      case 'Total House \$':
                        return Colors.blue;
                      case 'Total Necessary \$':
                        return Colors.green;
                      default:
                        return Colors.orange;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}:\n${pieData['measure']}\$";
                  },
                  labelPosition: PieLabelPosition.outside,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
