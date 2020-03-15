import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Map Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const double latitude = 12.9880;
  static const double longitude = 77.6895;
  List<Marker> mapMarkers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mapMarkers.add(Marker(
        markerId: MarkerId("MahaDevPura"),
        draggable: false,
        position: LatLng(latitude, longitude)
    ));
  }

  _openMap() async {
    var url;
    if (Platform.isAndroid) {
      url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    } else if (Platform.isIOS) {
      print("This is iOS Device?? O really, you got so rich?");
      url = 'http://maps.apple.com/?ll=52.32,4.917';
    } else {
      throw 'Platform not supported!';
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(latitude, longitude),
                  zoom: 12.0,
                ),
                markers: Set.from(mapMarkers),
              ),
              RaisedButton(
                onPressed: _openMap,
                child: const Text('Get Direction', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 5,
              )
            ],
          )


        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
