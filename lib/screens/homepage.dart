import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(
              flex: 5,
            ),
            const Text(
              'Welcome to Budget Buddy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8), // Border radius
                child: ClipOval(
                  child: Image.asset(
                    "assets/icon.png",
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 8,
            ),
            const Text(
              "click the button below to get started.\n"
              "make sure to add data before you start using the app",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
