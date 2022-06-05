import 'package:flutter/material.dart';
import 'device.dart';
import 'device_container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Device> devices = [
    Device("Wifi Router", Icons.rss_feed_rounded, "Drawing Room"),
    Device("Television", Icons.tv, "Drawing Room"),
    Device("Air Conditioner", Icons.ac_unit_outlined, "MasterBedroom"),
    Device("Study Lamp", Icons.light, "MasterBedroom"),
    Device("Massage Chair", Icons.chair_outlined, "Drawing Room"),
    Device("Air Condition", Icons.ac_unit, "MasterBedroom"),
  ];

  late List<Device> DrawingRoom =
      devices.where((device) => device.category == "Drawing Room").toList();
  late List<Device> MasterBedroom =
      devices.where((device) => device.category == "MasterBedroom").toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Home Controller App- Saif"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "All"),
                Tab(text: "MasterBedroom"),
                Tab(text: "Drawing Room"),
              ],
            ),
          ),
          body: TabBarView(children: [
            //*** Tap 1 ***//
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: GridView.count(
                childAspectRatio: (140 / 100),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: devices.map((device) {
                  return DeviceContainer(device);
                }).toList(),
              ),
            ),

            //*** Tap 2 ***//
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: GridView.count(
                childAspectRatio: (140 / 100),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: MasterBedroom.map((device) {
                  return DeviceContainer(device);
                }).toList(),
              ),
            ),

            //*** Tap 3 ***//
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: GridView.count(
                childAspectRatio: (140 / 100),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: DrawingRoom.map((device) {
                  return DeviceContainer(device);
                }).toList(),
              ),
            ),
          ])),
    ));
  }
}
