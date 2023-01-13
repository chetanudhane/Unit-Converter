import 'package:flutter/material.dart';
import 'package:unit_converter/screens/length_converter.dart';
import 'package:unit_converter/screens/temperature_converter.dart';
import 'package:unit_converter/screens/weight_converter.dart';
import 'package:unit_converter/ui/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    const Home(),
    const LengthConverter(),
    const WeightConverter(),
    const TemperatureConverter()
  ];

  void onTap(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: pageIndex,
          onTap: onTap,
          selectedItemColor: Colors.green,
          // unselectedItemColor: Colors.grey.withOpacity(0.7),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.scale), label: "Length"),
            BottomNavigationBarItem(
                icon: Icon(Icons.monitor_weight), label: "Weight"),
            BottomNavigationBarItem(
                icon: Icon(Icons.thermostat), label: "Temperature"),
          ]),
    );
  }
}
