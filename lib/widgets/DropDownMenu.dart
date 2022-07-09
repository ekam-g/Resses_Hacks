import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown(
      {Key? key,
      required this.one,
      required this.two,
      required this.three,
      required this.four,
      required this.five,
      required this.six})
      : super(key: key);
  final String one;
  final String two;
  final String three;
  final String four;
  final String five;
  final String six;

  @override
  State<DropDown> createState() => _DropDown();
}

class _DropDown extends State<DropDown> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
        widget.one,
        widget.two,
        widget.three,
        widget.four,
        widget.five,
        widget.six
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
