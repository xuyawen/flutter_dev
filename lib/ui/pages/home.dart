import 'package:flutter/material.dart';
import 'package:flutter_dev/ui/components/components.dart';
import './first.dart';
import './second.dart';
import './third.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

// SingleTickerProviderStateMixin is used for animation
class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopExit(
        child: Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("颈椎病临床科研信息采集系统", style: TextStyle(color: Colors.white)),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[FirstTab(), SecondTab(), ThirdTab()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.adb),
            ),
            Tab(
              icon: Icon(Icons.airport_shuttle),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    ));
  }
}
