import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  TextEditingController textEditingControllerUrl = new TextEditingController();
  TextEditingController textEditingControllerId = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  String api = 'AIzaSyCDkIpYOtfkU0xv03YNKCgCbUaD1GObOF4';
  List url = [
    "https://www.youtube.com/watch?v=DEEpLsleTls",
    "https://www.youtube.com/watch?v=pm3M7U2NCQQ",
    "https://www.youtube.com/watch?v=koIIS09Oywo",
    "https://www.youtube.com/watch?v=mG3unLGxWMY"
  ];
  void playYoutubeVideo(int index) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: api,
      videoUrl: url[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black54),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Tutorial',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20.0,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () => playYoutubeVideo(0),
              child: Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.play_arrow),
                      title: Text("How CashewNuts are grown!"),
                    ),
                  ],
                ),
              ),
              ),
            ),
            GestureDetector(
              onTap: () => playYoutubeVideo(1),
              child: Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.play_arrow),
                        title: Text("How Almonds are grown!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => playYoutubeVideo(2),
              child: Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.play_arrow),
                        title: Text("How Peanuts are grown!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => playYoutubeVideo(3),
              child: Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.play_arrow),
                        title: Text("How WaterMelon are grown!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
