import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class Photo extends StatelessWidget {
  Photo({this.photoLink, Key key}) : super(key: key);

  final String photoLink;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      child: CachedNetworkImage(
        imageUrl: photoLink,
        fit: BoxFit.fill,
      ),
    );
  }
}
