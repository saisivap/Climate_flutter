import 'package:flutter/material.dart';
String apiID="7b52c727afd90eb8a4922ef6594888dd";

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kInputBox=InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    // border: BorderRadius.all(50);
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white70,
                    ),
                    hintText: "Enter City Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  );
