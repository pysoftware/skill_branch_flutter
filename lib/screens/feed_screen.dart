import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Photo'),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.white,
          onPressed: () => {},
        ),
      ),
      body: Column(
        children: <Widget>[
            CustomButton(buttonText: 'ahah',),
            Photo(photoLink: 'https://avatars.mds.yandex.net/get-yapic/63032/ryhu3VlwQKuV0xPYGpBNaLcDaE-1571886154/islands-300',)
        ],
      ),
    );
  }
}
