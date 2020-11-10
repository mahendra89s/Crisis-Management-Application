import 'package:flutter/material.dart';
import 'package:calmity/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:calmity/screens/pages/chatroom_layout/chat_page.dart';
//import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Chatroom extends StatefulWidget with NavigationStates {
  @override
  _ChatroomState createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> with NavigationStates {
  String public = '5Ooj7UZXA5dfoqpSikj9';
  String mumbai = 'qT02oQ5XizXgcV5M6VRN';
  String delhi = '3rqnBydEFmIV9QdJU0FP';
  String bangalore = 'Jxnj8WQ8ShRnXTn9NSzZ';
  String rajasthan = 'wb6SeEbxnmaK242Qd45T';
  String gujarat = 'uEByZQ39pU3HoGG067nt';
  String kerala = 'hqHBYTfTTh7kFFvDSJw6';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 80, 0, 50),
            child: Center(
                child: Text(
              "CHATROOM",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28.0),
            )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: SizedBox(
              width: double.infinity,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(groupId: public)),
                  );
                },
                color: Colors.red,
                child: Text(
                  'PUBLIC CHATROOM',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 28.0,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(children: <Widget>[
            SizedBox(width: 20.0),
            Expanded(
              //margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SizedBox(
                width: 50,
                height: 100.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatPage(groupId: mumbai)),
                    );
                  },
                  color: Colors.red,
                  child: Text(
                    'Mumbai Channel',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              //margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SizedBox(
                //swidth: 50,
                height: 100.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatPage(groupId: delhi)),
                    );
                  },
                  color: Colors.red,
                  child: Text(
                    'Delhi Channel',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.0),
          ]),
          SizedBox(
            height: 20.0,
          ),
          Row(children: <Widget>[
            SizedBox(width: 20.0),
            Expanded(
              //margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SizedBox(
                width: 50,
                height: 100.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatPage(groupId: bangalore)),
                    );
                  },
                  color: Colors.red,
                  child: Text(
                    'Bangalore Channel',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              //margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SizedBox(
                //swidth: 50,
                height: 100.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatPage(groupId: rajasthan)),
                    );
                  },
                  color: Colors.red,
                  child: Text(
                    'Rajasthan Channel',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.0),
          ]),
          SizedBox(
            height: 20.0,
          ),
          Row(children: <Widget>[
            SizedBox(width: 20.0),
            Expanded(
              //margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SizedBox(
                width: 50,
                height: 100.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatPage(groupId: gujarat)),
                    );
                  },
                  color: Colors.red,
                  child: Text(
                    'Gujarat Channel',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              //margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SizedBox(
                //swidth: 50,
                height: 100.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatPage(groupId: kerala)),
                    );
                  },
                  color: Colors.red,
                  child: Text(
                    'Kerala Channel',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.0),
          ]),
        ]),
      ),
    );
  }
}
