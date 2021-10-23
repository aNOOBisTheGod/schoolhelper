import 'package:flutter/material.dart';
import '../models/settings_model.dart' as settings;
import 'dart:convert';
import '../models/usefulwisgets.dart' as useful;

import 'package:http/http.dart';
import 'package:html/parser.dart';

class ChemistScreen extends StatefulWidget {
  const ChemistScreen({Key? key}) : super(key: key);

  @override
  _ChemistScreenState createState() => _ChemistScreenState();
}

class _ChemistScreenState extends State<ChemistScreen> {
  String ans = "";
  @override
  void solveeq(a) {
    a = a.split(' ');
    String x = a[0], y = a[1];
    parsereq(x, y);
  }

  parsereq(String m, String n) async {
    setState(() {
      ans = '';
    });
    var client = Client();
    Response response = await client
        .get(Uri.parse('https://chemequations.com/ru/?s=$m+%2B+$n&ref=input'));
    var x = parse(response.body);
    setState(() {
      ans = x.getElementsByClassName("equation main-equation well")[0].text;
    });
  }

  Widget build(BuildContext context) {
    return Theme(
        data: settings.dark ? settings.darkTheme : settings.lightTheme,
        child: Scaffold(
          body: SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'insert elements',
                          labelStyle: TextStyle(
                              color: settings.dark
                                  ? settings.secondcold
                                  : settings.secondcoll),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: settings.dark
                                    ? settings.themecold
                                    : settings.themecoll,
                                width: 5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: settings.dark
                                    ? settings.secondcold
                                    : settings.secondcoll,
                                width: 3.0),
                          ),
                          helperText: 'Insert elements of equation',
                          hoverColor: settings.dark
                              ? settings.secondcold
                              : settings.secondcoll,
                          hintText: 'Insert elements of equation'),
                      onSubmitted: (a) => solveeq(a)),
                  Padding(padding: EdgeInsets.all(10)),
                  ans == ''
                      ? Image.asset('assets/images/yH.gif')
                      : useful.beutyresult(ans),
                ],
              )),
        ));
  }
}
