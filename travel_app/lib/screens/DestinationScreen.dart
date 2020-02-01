import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/Activity.dart';
import 'package:travel_app/models/destination.dart';

class DestinationScreen extends StatefulWidget {
  final Destination _destination;

  DestinationScreen(this._destination);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _buildTopImage(context),
        _buildDestinationList(),
      ],
    ));
  }

  Widget _buildTopImage(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(0.0, 2.0))
            ]),
        child: Hero(
          tag: "${widget._destination.imageUrl}",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image(
              image: AssetImage(widget._destination.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 30.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () => Navigator.pop(context)),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: null),
                  IconButton(
                      icon: Icon(FontAwesomeIcons.sortAmountDown),
                      iconSize: 20.0,
                      color: Colors.black,
                      onPressed: null),
                ],
              )
            ]),
      ),
      Positioned(
        left: 20.0,
        bottom: 20.0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget._destination.city,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.locationArrow,
                    size: 15.0,
                    color: Colors.white70,
                  ),
                  SizedBox(width: 5.0),
                  Text(widget._destination.country,
                      style: TextStyle(color: Colors.white70, fontSize: 20.0))
                ],
              )
            ]),
      ),
      Positioned(
        right: 20.0,
        bottom: 20.0,
        child: Icon(
          Icons.location_on,
          size: 25.0,
          color: Colors.white70,
        ),
      )
    ]);
  }

  Widget _buildDestinationList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
          itemCount: widget._destination.activities.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildDestinationListItem(
                widget._destination.activities[index]);
          }),
    );
  }

  Widget _buildDestinationListItem(Activity activity) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
          height: 170.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      child: Text(
                        activity.name,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text("\$${activity.price}",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600)),
                        Text("per pax",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey))
                      ],
                    )
                  ],
                ),
                Text(activity.type,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey)),
                SizedBox(height: 5.0),
                _buildRatingStarts(activity.rating),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5.0),
                        width: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Theme.of(context).accentColor),
                        child: Text(activity.startTimes[0]),
                        alignment: Alignment.center),
                    SizedBox(width: 5.0),
                    Container(
                        padding: EdgeInsets.all(5.0),
                        width: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Theme.of(context).accentColor),
                        child: Text(activity.startTimes[1]),
                        alignment: Alignment.center)
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          top: 15.0,
          bottom: 15.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              width: 110.0,
              image: AssetImage(activity.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRatingStarts(int ratings) {
    String stars = "";
    for (int i = 0; i < ratings; i++) {
      stars += "⭐ ";
    }

    stars.trimRight();
    return Text(stars);
  }
}
