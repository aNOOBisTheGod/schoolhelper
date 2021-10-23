import '../models/settings_model.dart' as settings;
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var rng = new Random();
  var _counter = 0;
  void rountR() {
    setState(() {
      _counter = rng.nextInt(settings.bord - settings.start).toInt() +
          settings.start +
          1;
      if (_counter % 2 != 0 && settings.even) {
        _counter -= 1;
      }
      if (_counter % 2 == 0 && settings.odd) {
        _counter -= 1;
      }
      if (_counter % settings.mod != 0 && settings.usemod) {
        _counter -= _counter % settings.mod;
      }
      if (settings.coinflip) {
        _counter = rng.nextInt(2).toInt();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: settings.dark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        body: Container(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                !settings.coinflip
                    ? _counter.toString()
                    : _counter == 1
                        ? 'Heads'
                        : 'Tails',
                style: TextStyle(fontSize: 40),
              ),
              Padding(padding: EdgeInsets.all(20)),
              RaisedButton(
                padding:
                    EdgeInsets.all((MediaQuery.of(context).size.width) * 0.05),
                child: Text(
                  !settings.coinflip
                      ? 'Create Random Number'
                      : 'Heads & Tails Mode',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: rountR,
                color: settings.dark ? settings.themecold : settings.themecoll,
                elevation: 10,
                highlightColor:
                    settings.dark ? settings.secondcold : settings.secondcoll,
                onLongPress: () {
                  setState(() {
                    _counter = 0;
                  });
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
