import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const IMAGE_URI =
    'https://avatars.mds.yandex.net/get-yapic/63032/ryhu3VlwQKuV0xPYGpBNaLcDaE-1571886154/islands-300';

class FullScreenImage extends StatelessWidget {
  final String altDescription;
  final String userName;
  final String name;

  FullScreenImage(
      {this.altDescription = 'default text', this.userName, this.name, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Photo'),
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            color: Colors.white,
            onPressed: () => {},
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Photo(
                    photoLink: IMAGE_URI,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    '$altDescription',
                    style: AppStyles.h3,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      UserAvatar(
                        avatarUri: IMAGE_URI,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '$name',
                            style: AppStyles.h1Black,
                          ),
                          Text(
                            '@$userName',
                            style: AppStyles.h5Black
                                .copyWith(color: AppColors.manatee),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      LikeButton(true, 10),
                      _customButton(
                        'Save',
                      ),
                      _customButton(
                        'Visit',
                      )
                    ],
                  )
                ],
              ),
            )));
  }

  Widget _customButton(String buttonText) {
    return GestureDetector(
      child: Container(
          alignment: Alignment.center,
          width: 105,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: Colors.lightBlueAccent),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 21),
            child: Text(
              '$buttonText',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )),
      onTap: () => {},
    );
  }
}
