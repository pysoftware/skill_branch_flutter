import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class UserAvatar extends StatefulWidget {
  final String avatarUri;

  UserAvatar({this.avatarUri, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserAvatarState();
  }
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: CachedNetworkImage(
        width: 40,
        height: 40,
        imageUrl: widget.avatarUri,
      ),
    );
  }
}
