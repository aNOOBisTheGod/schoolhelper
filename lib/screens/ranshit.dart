import 'package:flutter/material.dart';
import '../models/settings_model.dart' as settings;
import 'dart:convert';

import 'package:http/http.dart';
import 'package:html/parser.dart';
import '../models/usefulwisgets.dart' as useful;

class Randomshit extends StatefulWidget {
  const Randomshit({Key? key}) : super(key: key);

  @override
  _RandomshitState createState() => _RandomshitState();
}

class _RandomshitState extends State<Randomshit> {
  String src = 'https://c.tenor.com/pCcL8OOdEBUAAAAM/gifs-away-gif.gif';
  @override
  String searcher = '';
  void wikisearch(a) async {
    print(a);
    String b = a.replaceAll(' ', '_');
    setState(() {
      searcher = '';
    });
    var client = Client();
    Response response =
        await client.get(Uri.parse('https://en.wikipedia.org/wiki/' + b));
    var x = parse(response.body);
    for (String i
        in x.getElementsByClassName("mw-parser-output")[0].text.split('\n')) {
      if (i.length > 200 && !i.contains('parser') && i.contains(a + ' ')) {
        print(i);
        setState(() {
          searcher = i;
        });
        return;
      }
    }
  }

  Widget build(BuildContext context) {
    return Theme(
        data: settings.dark ? settings.darkTheme : settings.lightTheme,
        child: Scaffold(
          body: SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Text('Fast wiki search(in development):'),
                  useful.themedtextfield(
                      wikisearch, 'Input text', 'idek', 'also idek'),
                  Text(searcher),
                ],
              )),
        ));
  }
}
