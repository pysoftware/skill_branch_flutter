import 'package:FlutterGalleryApp/res/app_icons.dart';
import 'package:flutter/cupertino.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final int likesCount;

  LikeButton(this.isLiked, this.likesCount, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LikeButtonState();
  }
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked;
  int likesCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    likesCount = widget.likesCount;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 33),
        child: Container(
          width: 60,
          child: Row(
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                    if (isLiked) {
                      likesCount++;
                    } else {
                      likesCount--;
                    }
                  });
                },
                child: Icon(isLiked ? AppIcons.like_fill : AppIcons.like),
              ),
              SizedBox(width: 5),
              Text(
                '$likesCount',
              )
            ],
          ),
        ));
  }
}
