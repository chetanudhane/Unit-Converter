import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({Key? key}) : super(key: key);

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final List<String> measures = [
    "Celsius",
    "Fahrenheits",
    "Kelvins",
  ];

  final Map<String, int> measuresMap = {
    "Celsius": 0,
    "Fahrenheits": 1,
    "Kelvins": 2,
  };

  dynamic formulas = {
    "0": [1, 33.8, 274.15],
    "1": [-17.2222, 1, 255.92],
    "2": [-272.15, -457.87, 1],
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
  String _startMeasures = "Celsius";
  String _convertMeasures = "Celsius";
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
                  "Temperature Units",
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
