import 'package:flutter/material.dart';

class WeightConverter extends StatefulWidget {
  const WeightConverter({Key? key}) : super(key: key);

  @override
  State<WeightConverter> createState() => _WeightConverterState();
}

class _WeightConverterState extends State<WeightConverter> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final List<String> measures = [
    "Milligrams",
    "Grams",
    "Kilograms",
    "Tonnes",
    "Pounds (lb)",
    "Ounces",
  ];

  final Map<String, int> measuresMap = {
    "Milligrams": 0,
    "Grams": 1,
    "Kilograms": 2,
    "Tonnes": 3,
    "Pounds (lb)": 4,
    "Ounces": 5,
  };

  dynamic formulas = {
    "0": [1, 0.001, 0.000001, 0, 0, 0.00004],
    "1": [1000, 1, 0.001, 0.000001, 0.0022, 0.03527],
    "2": [1000000, 1000, 1, 0.001, 2.2046, 35.2739],
    "3": [1000000000, 1000000, 1000, 1, 2204.6226, 35274],
    "4": [453592.3, 453.592, 0.4535, 0.00045, 1, 16],
    "5": [28349.5, 28.3495, 0.02835, 0.00003, 0.0625, 1],
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
  String _startMeasures = "Milligrams";
  String _convertMeasures = "Milligrams";
  String resultMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: <Widget>[
                const Text(
                  "Weight Units",
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
