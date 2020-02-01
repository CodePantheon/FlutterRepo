import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/DestinationSlider.dart';
import 'package:travel_app/widgets/HotelSlider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  int _selectedIndex = 0;
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          _buildTitleText(),
          SizedBox(height: 20.0),
          _buildTravelItems(),
          SizedBox(height: 20.0),
          DestinationSlider(),
          SizedBox(height: 20.0),
          HotelSlider()
        ],
      )),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  static Widget _buildTitleText() {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 120.0),
        child: Text("What you would like to find?",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)));
  }

  Widget _buildTravelItems() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _icons.map((icon) => _buildIcon(icon)).toList());
  }

  Widget _buildIcon(IconData icon) {
    int index = _icons.indexOf(icon);
    return GestureDetector(
        onTap: () => {setState(() => _selectedIndex = index)},
        child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? Theme.of(context).accentColor
                    : Color(0xFFE7EBEE),
                borderRadius: BorderRadius.circular(30.0)),
            child: Icon(icon,
                size: 25.0,
                color: _selectedIndex == index
                    ? Theme.of(context).primaryColor
                    : Color(0xFFB4C1C4))));
  }

  Widget _buildNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) => {setState(() => _currentTab = value)},
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30.0,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://i.imgur.com/zL4Krbz.jpg"),
                radius: 15.0,
              ),
              title: SizedBox.shrink())
        ]);
  }
}
