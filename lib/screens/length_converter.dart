import 'package:flutter/material.dart';

class LengthConverter extends StatefulWidget {
  const LengthConverter({Key? key}) : super(key: key);

  @override
  State<LengthConverter> createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final List<String> measures = [
    "Inch",
    "Centimeters",
    "Meters",
    "Kilometers",
    "Feet",
    "Miles",
    "Yards",
  ];

  final Map<String, int> measuresMap = {
    "Inch": 0,
    "Centimeters": 1,
    "Meters": 2,
    "Kilometers": 3,
    "Feet": 4,
    "Miles": 5,
    "Yards": 6,
  };

  dynamic formulas = {
    "0": [1, 2.54, 0.0254, 0.00002539, 0.08333, 0.00001578, 0.02777],
    "1": [0.3937, 1, 0.01, 0.00001, 0.03280, 0.000006213, 0.01093],
    "2": [39.37, 100, 1, 0.001, 3.2808, 0.0006213, 1.0936],
    "3": [3937, 100000, 1000, 1, 3280.83, 0.6213, 1093.61],
    "4": [12, 30.48, 0.3048, 0.0003, 1, 0.00019, 0.3333],
    "5": [63360, 160934, 1609.344, 1.6093, 5280, 1, 1760],
    "6": [36, 91.44, 0.9144, 0.00091, 3, 0.00057, 1],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              children: <Widget>[
                const Text(
                  "Length Units",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  "Converter",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: TextField(
                    onChanged: (text) {
                      var input = double.tryParse(text);
                      if (input != null) {
                        setState(() {
                          userInput = input;
                        });
                      }
                    },
                    style: const TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: "Enter your value",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "From",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _startMeasures,
                        isExpanded: true,
                        dropdownColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.amber),
                        hint: const Text(
                          "Choose a unit",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 20,
                          ),
                        ),
                        items: measures.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _startMeasures = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "To",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _convertMeasures,
                        isExpanded: true,
                        dropdownColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.amber),
                        hint: const Text(
                          "Choose a unit",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 20,
                          ),
                        ),
                        items: measures.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _convertMeasures = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    if (_startMeasures.isEmpty ||
                        _convertMeasures.isEmpty ||
                        userInput == 0) {
                      return;
                    } else {
                      convert(userInput, _startMeasures, _convertMeasures);
                    }
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Convert",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          color: Colors.amber),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    ((resultMessage == null) ? "" : resultMessage),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
