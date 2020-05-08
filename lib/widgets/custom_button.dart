import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
    CustomButton({this.buttonText});

    final String buttonText;

    @override
    Widget build(BuildContext context) {
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
                )
            ),
            onTap: () => {},
        );
    }
}
