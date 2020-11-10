import 'package:flutter/material.dart';
import 'package:calmity/bloc.navigation_bloc/navigation_bloc.dart';
import 'chatroom.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_sms/flutter_sms.dart';
//import 'package:sms/sms.dart';
import 'package:sms_maintained/sms.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:calmity/screens/pages/help.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calmity/screens/pages/map_service/places.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:calmity/screens/pages/map_service/latlng.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calmity/screens/pages/need_help/needHelp.dart';
import 'package:shake/shake.dart';

class Home extends StatefulWidget with NavigationStates {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth1 = FirebaseAuth.instance;
  Position _currentPosition;
  String _currentAddress;
  bool isSwitched = false;
  String username;
  FirebaseUser user;
  getlocation() async {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    });

    user = await _auth1.currentUser();
    Firestore.instance
        .collection('users')
        .document((await _auth1.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        username = value.data['name'].toString();
      });
    });
    Firestore.instance
        .collection('needhelp')
        .document((await _auth1.currentUser()).uid)
        .setData({
      'longitude': _currentPosition.longitude.toString(),
      'latitude': _currentPosition.latitude.toString(),
      'user': username
    }).then((value) => print("Data Updated"));
  }

  deletelocation() async {
    Firestore.instance
        .collection('needhelp')
        .document((await _auth1.currentUser()).uid)
        .delete();
  }

  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      _getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            DashboardScreen(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    if (value == true) {
                      getlocation();
                    } else {
                      deletelocation();
                    }
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Chatroom()),
                        );
                      },
                      color: Colors.red,
                      child: Text(
                        'chatroom'.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150.0),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: RaisedButton(
                        onPressed: () {
                          _getCurrentLocation();
                        },
                        color: Colors.red,
                        child: Text(
                          'SOS',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Help()),
                        );
                      },
                      color: Colors.red,
                      child: Text(
                        'chatbot'.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
      print(_currentAddress);

      SmsSender sender = SmsSender();
      String address = "9594757772";
      String message1 = 'Please Send Help at ' +
          _currentAddress +
          " " +
          "http://maps.google.com/?q=" +
          _currentPosition.latitude.toString() +
          "," +
          _currentPosition.longitude.toString();
      SmsMessage message = SmsMessage(address, message1);
      message.onStateChanged.listen((state) {
        if (state == SmsMessageState.Sent) {
          print("SMS is sent!");
          SnackBar snackbar = SnackBar(content: Text("SMS is Sent"));
          _scaffoldKey.currentState.showSnackBar(snackbar);
        } else if (state == SmsMessageState.Delivered) {
          print("SMS is delivered!");
        }
      });
      sender.sendSms(message);
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}

class Mapshow extends StatefulWidget {
  String Latitude;
  String Longitude;

  Mapshow({this.Latitude, this.Longitude});
  @override
  MapshowState createState() => MapshowState();
}

class MapshowState extends State<Mapshow> {
  Completer<GoogleMapController> _controller = Completer();
  bool _loading;
  List<Places> _notes = List<Places>();

  Future<List<Places>> fetchNotes(latitude, longitude) async {
    var url = 'http://192.168.1.111/location?loc=${latitude},${longitude}';
    var response = await http.get(url);

    var notes = List<Places>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      print(
          "##################################################################################################################################################################################################################################################################################");
      print(notesJson['response'][0]);
      print(
          "##################################################################################################################################################################################################################################################################################");
      for (var noteJson in notesJson['response']) {
        notes.add(Places.fromJson(noteJson));
      }
    }

    return notes;
  }

  List<Needhelp> helplist = [];
  Future getLocationData() async {
    QuerySnapshot snap =
        await Firestore.instance.collection('needhelp').getDocuments();

    snap.documents.forEach((element) {
      Needhelp help = Needhelp(
        username: element['user'],
        latitude: element['latitude'],
        longitude: element["longitude"],
      );
      helplist.add(help);
    });
    print(
        "##################################################################################################################################################################################################################################################################################");
    //print(helplist.length);
    print(
        "##################################################################################################################################################################################################################################################################################");
  }

  @override
  void initState() {
    getLocationData();

    _loading = true;

    fetchNotes(widget.Latitude, widget.Longitude).then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _loading = false;
      });
    });

    super.initState();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Stack(
              children: <Widget>[
                _buildGoogleMap(context, double.parse(widget.Latitude),
                    double.parse(widget.Longitude), helplist),
              ],
            ),
          );
  }

  Widget _buildGoogleMap(
      BuildContext context, double latitude, double longitude, helplist) {
    final Map<String, Marker> _markers = {};

    print(
        "##################################################################################################################################################################################################################################################################################");
    print(helplist.length);
    print(
        "##################################################################################################################################################################################################################################################################################");

    for (int i = 0; i < helplist.length; i++) {
      print(helplist[i].username);
      Marker mark = Marker(
        markerId: MarkerId(helplist[i].username),
        position: LatLng(double.parse(helplist[i].latitude),
            double.parse(helplist[i].longitude)),
        infoWindow: InfoWindow(title: helplist[i].username),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ),
      );
      setState(() {
        _markers[helplist[i].username] = mark;
      });
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(latitude, longitude), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }
}

/*
Container(
                color: Colors.transparent,
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 80, 0, 80),
                    child: Center(
                      child: Text(
                        "home_page".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 28.0),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Chatroom()),
                              );
                            },
                            color: Colors.red,
                            child: Text(
                              'chatroom'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 120.0,
                          child: RaisedButton(
                            onPressed: () {
                              _getCurrentLocation();
                            },
                            color: Colors.red,
                            child: Text(
                              'SOS',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Help()),
                              );
                            },
                            color: Colors.red,
                            child: Text(
                              'chatbot'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ])),
                */
