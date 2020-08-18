import 'package:app_jadwal_solat/screen2_content.dart';
import 'package:app_jadwal_solat/model/ResponseJadwal.dart';
import 'package:app_jadwal_solat/screen2.dart';
import 'package:app_jadwal_solat/screen_1.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter app',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyNavbar (),
    );
  }
}

class MyNavbar extends StatefulWidget {
  MyNavbar({Key key}) :super(key : key);

  @override
  _MyNavbarState createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30 , fontWeight: FontWeight.bold);
  List <Widget> _widgetOptions =
  <Widget>[
    Screen1(),

    Screen2(),

    Text('screen 3', style: optionStyle),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:  Container(
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on, color: Colors.white,),
              title: Text('Lokasi', style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.black54,
            ),  //Type Anything Here To Fill The Page
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule, color: Colors.white,),
              title: Text('Jadwal', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.black45,
            ),  //Type Anything Here To Fill The Page
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_upward, color: Colors.white,),     //Type Anything Here To Fill The Page
              title: Text('Kiblat', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.black45,
            ),],
          currentIndex: _selectedIndex,
          selectedFontSize: 15.0,
          onTap: _onItemTapped,
          backgroundColor: Colors.black87,
          elevation: 0,
        ),
      ),
    );
  }




}


