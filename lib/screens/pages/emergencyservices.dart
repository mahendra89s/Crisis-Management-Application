import 'package:flutter/material.dart';
import 'package:calmity/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:calmity/screens/pages/emergency_layout/latlng.dart';
import 'package:calmity/screens/pages/emergency_layout/note.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:calmity/screens/pages/call_service/service_locator.dart';
import 'package:calmity/screens/pages/call_service/calls_and_messages_service.dart';

class Emergencyservices extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return DashboardScreen();
  }
}

class EmergencyPage extends StatefulWidget {
  String Latitude;
  String Longitude;

  EmergencyPage({this.Latitude, this.Longitude});

  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  List<Note> _notes = List<Note>();

  Future<List<Note>> fetchNotes(latitude, longitude) async {
    var url = 'http://192.168.1.111/data?loc=${latitude},${longitude}';
    var response = await http.get(url);

    var notes = List<Note>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      print(notesJson['response']);
      for (var noteJson in notesJson['response']) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes(widget.Latitude, widget.Longitude).then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    setupLocator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "emergency_services".tr(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
                child: MaterialButton(
                  onPressed: () => _service.call(_notes[index].number),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _notes[index].name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        _notes[index].number,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: _notes.length,
        ));
  }
}
