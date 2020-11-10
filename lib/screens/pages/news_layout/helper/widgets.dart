import 'package:flutter/material.dart';
import 'package:calmity/screens/pages/news_layout/views/article_view.dart';

Widget MyAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.red),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // ClipRRect(
                  //     borderRadius: BorderRadius.circular(6),
                  //     child: Image.network(
                  //       imgUrl,
                  //       height: 200,
                  //       width: MediaQuery.of(context).size.width,
                  //       fit: BoxFit.cover,
                  //     )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    maxLines: 6,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
