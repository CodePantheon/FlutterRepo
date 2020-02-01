import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/screens/DestinationScreen.dart';

class DestinationSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTitleRow(context),
        SizedBox(height: 10.0),
        _buildDestinationList()
      ],
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Top Destinations",
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          ),
          GestureDetector(
              //onTap: ,
              child: Text(
            "See All",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor),
          ))
        ],
      ),
    );
  }

  Widget _buildDestinationList() {
    return Container(
        height: 300.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: _buildDestinationListItem,
        ));
  }

  Widget _buildDestinationListItem(BuildContext context, int index) {
    Destination destination = destinations[index];

    return GestureDetector(
      onTap: () => _goToDestinationPage(context, destination),
      child: Container(
        width: 210.0,
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: 15.0,
              child: Container(
                  height: 120.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("${destination.activities.length} activities",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2)),
                          Text("${destination.description}",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey))
                        ]),
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]),
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: "${destination.imageUrl}$index",
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 180.0,
                          width: 180.0,
                          image: AssetImage(destination.imageUrl),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${destination.city}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.locationArrow,
                                size: 10.0,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5.0),
                              Text("${destination.country}",
                                  style: TextStyle(color: Colors.white))
                            ],
                          )
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _goToDestinationPage(BuildContext context, Destination destination) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => DestinationScreen(destination)));
  }
}
