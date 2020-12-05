import 'package:flutter/material.dart';
import 'package:lapor_app/ui/home.dart';
import 'package:lapor_app/ui/lapor.dart';
import 'package:lapor_app/ui/About.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNabar(),
    );
  }
}


class BottomNabar extends StatefulWidget {
  @override
  _BottomNabarState createState() => _BottomNabarState();
}

class _BottomNabarState extends State<BottomNabar> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Lapor(),
    About(),
  ];

  void onTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
       bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  // ignore: deprecated_member_use
                  title: Text('Home'),
                  ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_alert_rounded),
                  // ignore: deprecated_member_use
                  title: Text('Lapor'),
                  ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded),
                  // ignore: deprecated_member_use
                  title: Text('About'),
                  ),
              ],
              onTap: onTapped,
              
            ),
    );
  }
}