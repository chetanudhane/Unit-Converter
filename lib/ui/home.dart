import 'package:unit_converter/screens/temperature_converter.dart';
import 'package:unit_converter/screens/length_converter.dart';
import 'package:unit_converter/screens/weight_converter.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final List<String> measures = [
    "Meters",
    "Kilometers",
    "Grams",
    "Kilograms",
    "Feet",
    "Miles",
    "Pounds (lbs)",
    "Ounces",
  ];

  final Map<String, int> measuresMap = {
    "Meters": 0,
    "Kilometers": 1,
    "Grams": 2,
    "Kilograms": 3,
    "Feet": 4,
    "Miles": 5,
    "Pounds (lbs)": 6,
    "Ounces": 7,
  };

  dynamic formulas = {
    "0": [1, 0.001, 0, 0, 3.280, 0.0006213, 0],
    "1": [1000, 1, 0, 0, 3280.84, 0.6213, 0, 0],
    "2": [0, 0, 1, 0.0001, 0, 0, 0.00220, 0.03],
    "3": [0, 0, 1000, 1, 0, 0, 2.2046, 35.274],
    "4": [0.0348, 0.00030, 0, 0, 1, 0.000189],
    "5": [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    "6": [0, 0, 453.592, 0.4535, 0, 0, 1, 16],
    "7": [0, 0, 28.3495, 0, 02834, 3.28084, 0, 0.1]
  };

  void convert(double value, String from, String to) {
    int? nFrom = measuresMap[from];
    int? nTo = measuresMap[to];
    var multi = formulas[nFrom.toString()][nTo];
    var result = value * multi;
    if (result == 0) {
      resultMessage = "Cannot Performed This Conversion";
    } else {
      resultMessage =
          "${userInput.toString()} $_startMeasures are ${result.toString()} $_convertMeasures";
    }
    setState(() {
      resultMessage = resultMessage;
    });
  }

  late double userInput;
  String _startMeasures = "Meters";
  String _convertMeasures = "Meters";
  String resultMessage = "";

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
              children: const <Widget>[
                Text(
                  "Measures",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Converter",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 150.0,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "To",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Units",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Converter",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Padding(
                //   padding:
                //   const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                //   child: TextField(
                //     onChanged: (text) {
                //       var input = double.tryParse(text);
                //       if (input != null) {
                //         setState(() {
                //           userInput = input;
                //         });
                //       }
                //     },
                //     style: const TextStyle(
                //       fontSize: 22.0,
                //       color: Colors.black,
                //     ),
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: Colors.grey[300],
                //       hintText: "Enter your value",
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20.0),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const Text(
                //   "From",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w600,
                //     fontSize: 20,
                //   ),
                // ),
                // Padding(
                //   padding:
                //   const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: DropdownButtonHideUnderline(
                //       child: DropdownButton(
                //         value: _startMeasures,
                //         isExpanded: true,
                //         dropdownColor: Colors.black,
                //         style: const TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.w700,
                //             color: Colors.amber),
                //         hint: const Text(
                //           "Choose a unit",
                //           style: TextStyle(
                //             color: Colors.amber,
                //             fontSize: 20,
                //           ),
                //         ),
                //         items: measures.map((String value) {
                //           return DropdownMenuItem(
                //               value: value, child: Text(value));
                //         }).toList(),
                //         onChanged: (value) {
                //           setState(() {
                //             _startMeasures = value!;
                //           });
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const Text(
                //   "To",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w600,
                //     fontSize: 20,
                //   ),
                // ),
                // Padding(
                //   padding:
                //   const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: DropdownButtonHideUnderline(
                //       child: DropdownButton(
                //         value: _convertMeasures,
                //         isExpanded: true,
                //         dropdownColor: Colors.black,
                //         style: const TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.w700,
                //             color: Colors.amber),
                //         hint: const Text(
                //           "Choose a unit",
                //           style: TextStyle(
                //             color: Colors.amber,
                //             fontSize: 20,
                //           ),
                //         ),
                //         items: measures.map((String value) {
                //           return DropdownMenuItem(
                //               value: value, child: Text(value));
                //         }).toList(),
                //         onChanged: (value) {
                //           setState(() {
                //             _convertMeasures = value!;
                //           });
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                // TextButton(
                //   onPressed: () {
                //     if (_startMeasures.isEmpty ||
                //         _convertMeasures.isEmpty ||
                //         userInput == 0) {
                //       return;
                //     } else {
                //       convert(userInput, _startMeasures, _convertMeasures);
                //     }
                //   },
                //   child: Container(
                //     alignment: AlignmentDirectional.center,
                //     width: 200,
                //     height: 70,
                //     decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: const Text(
                //       "Convert",
                //       style: TextStyle(
                //           fontWeight: FontWeight.w700,
                //           fontSize: 40,
                //           color: Colors.amber),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 12.0),
                //   child: Text(
                //     ((resultMessage == null) ? "" : resultMessage),
                //     textAlign: TextAlign.center,
                //     style: const TextStyle(
                //       fontSize: 30,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
