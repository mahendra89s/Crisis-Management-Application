import 'package:flutter/material.dart';
import 'package:calmity/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class Help extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void response(query) async {
    AuthGoogle authGoogle;
    authGoogle =
        await AuthGoogle(fileJson: 'assets/calmitybot-uhln-c4655f51fd89.json')
            .build();
    Dialogflow dialogflow;
    dialogflow = Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber[50],
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
              alignment: Alignment.center,
              height: 50.0,
              width: 400.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                "Chatbot",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Flexible(
                        child: TextField(
                      controller: messageInsert,
                      decoration: InputDecoration.collapsed(
                          hintText: "Send your message",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                    )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                          icon: Icon(
                            Icons.send,
                            size: 30.0,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            if (messageInsert.text.isEmpty) {
                              print("empty message");
                            } else {
                              setState(() {
                                messsages.insert(0,
                                    {"data": 1, "message": messageInsert.text});
                              });
                              response(messageInsert.text);
                              messageInsert.clear();
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          color: data == 0 ? Colors.deepOrange : Colors.orangeAccent,
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ))
              ],
            ),
          )),
    );
  }
}
