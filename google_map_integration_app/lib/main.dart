import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  final double latitude = 12.9880;
  final double longitude = 77.6895;
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
          child:
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 12.0,
            ),
            markers: Set.from(mapMarkers),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
