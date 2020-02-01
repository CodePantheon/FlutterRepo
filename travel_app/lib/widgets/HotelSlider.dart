import 'package:flutter/material.dart';
import 'package:travel_app/models/Hotel.dart';

class HotelSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTitleRow(context),
        SizedBox(height: 10.0),
        _buildHotelList()
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
            "Exclusive Hotels",
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

  Widget _buildHotelList() {
    return Container(
        height: 300.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hotels.length,
          itemBuilder: _buildHotelListItem,
        ));
  }

  Widget _buildHotelListItem(BuildContext context, int index) {
    Hotel hotel = hotels[index];

    return Container(
      width: 240.0,
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            bottom: 15.0,
            child: Container(
                height: 120.0,
                width: 240.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(hotel.name,
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2)),
                        SizedBox(height: 2.0),
                        Text(hotel.address, style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 2.0),
                        Text("\$${hotel.price} / night",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600))
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
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  height: 180.0,
                  width: 220.0,
                  image: AssetImage(hotel.imageUrl),
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
    );
  }
}
