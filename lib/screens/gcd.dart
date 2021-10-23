import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/settings_model.dart' as settings;
import 'dart:math';

class MathScreen extends StatefulWidget {
  const MathScreen({Key? key}) : super(key: key);

  @override
  _MathScreenState createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> {
  int gcdcounter = 0;
  int xeq = 0;
  int yeq = 0;
  int modamain = 0;
  int medi = 0;
  dynamic sqrtx1 = 0;
  dynamic sqrtx2 = 0;
  void solvegcd(a) {
    a = a.split(' ');
    List<dynamic> dataListAsInt = a.map((data) => int.parse(data)).toList();
    int g = dataListAsInt[0];
    dataListAsInt.removeAt(0);
    for (var i = 0; i < dataListAsInt.length; i++) {
      g = gcd(g, dataListAsInt[i])[0];
    }
    setState(() {
      gcdcounter = g;
    });
  }

  void solveeq(x) {
    x = x.split(' ');
    List<dynamic> dataListAsInt = x.map((data) => int.parse(data)).toList();
    int a = dataListAsInt[0];
    int b = dataListAsInt[1];
    int c = dataListAsInt[2];
    List n = gcd(a, b);
    int d = n[0];
    int z = n[1];
    int y = n[2];
    if (c % d != 0) {
      xeq = 0;
      yeq = 0;
    } else {
      z *= c ~/ d;
      y *= c ~/ d;
      a ~/= d;
      b ~/= d;
      setState(() {
        xeq = z % b;
        yeq = y + (z - z % b) ~/ b * a;
      });
    }
  }

  Widget dividor() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(10)),
        Container(
          width: (MediaQuery.of(context).size.width) * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[settings.dark ? 600 : 300],
          ),
          height: 5,
        ),
        Padding(padding: EdgeInsets.all(10)),
      ],
    );
  }

  gcd(int a, int b) {
    if (b == 0) {
      return [a, 1, 0];
    }
    List n = gcd(b, a % b);
    int d = n[0];
    int x = n[1];
    int y = n[2];
    return [d, y, x - y * (a ~/ b)];
  }

  void mode(a) {
    a = a.split(' ');
    List<dynamic> x = a.map((data) => int.parse(data)).toList();
    x.sort();
    print(x);
    x.add(0);
    int counter = 0;
    int moda = 0;
    int n = 0;
    for (var i = 1; i < x.length; i++) {
      if (x[i] == x[i - 1]) {
        moda += 1;
      } else {
        if (moda > counter) {
          counter = moda;
          moda = 0;
          n = x[i - 1];
        } else {
          moda = 0;
        }
      }
    }
    setState(() {
      modamain = n;
      medi = x[x.length ~/ 2 - 1];
    });
  }

  int power(int x, int n) {
    int retval = 1;
    for (int i = 0; i < n; i++) {
      retval *= x;
    }

    return retval;
  }

  equation(a) {
    a = a.split(' ');
    List<dynamic> x = a.map((data) => int.parse(data)).toList();
    num d = power(x[1], 2) - 4 * x[0] * x[2];
    if (d < 0) {
      setState(() {
        sqrtx1 = 'null';
        sqrtx2 = 'null';
      });
    } else if (d == 0) {
      setState(() {
        sqrtx1 = -x[1] / (2 * x[0]);
        sqrtx2 = 'null';
      });
    } else {
      setState(() {
        sqrtx1 = (-x[1] - sqrt(d)) / (2 * x[0]);
        sqrtx2 = (-x[1] + sqrt(d)) / (2 * x[0]);
      });
    }
  }

  Color themecol = Colors.black;
  @override
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
                      labelText: "insert a, b and so on...",
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
                      helperText: 'Insert nums for gcd',
                      hoverColor: settings.dark
                          ? settings.secondcold
                          : settings.secondcoll,
                      hintText: 'Insert nums for gcd'),
                  onSubmitted: (a) => solvegcd(a)),
              Text(
                gcdcounter.toString(),
                style: TextStyle(fontSize: 30),
              ),
              dividor(),
              TextField(
                  decoration: InputDecoration(
                      labelText: 'insert a, b, c',
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
                      helperText: 'Insert coeficents of equation',
                      hoverColor: settings.dark
                          ? settings.secondcold
                          : settings.secondcoll,
                      hintText: 'Insert coeficents of equation'),
                  onSubmitted: (a) => solveeq(a)),
              Text(
                'x: $xeq',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'y: $yeq',
                style: TextStyle(fontSize: 30),
              ),
              dividor(),
              TextField(
                  decoration: InputDecoration(
                      labelText: 'insert list',
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
                      helperText: 'Insert list in here',
                      hoverColor: settings.dark
                          ? settings.secondcold
                          : settings.secondcoll,
                      hintText: 'Insert list in here'),
                  onSubmitted: (a) => mode(a)),
              Text(
                'Moda: $modamain',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Mediana: $medi',
                style: TextStyle(fontSize: 30),
              ),
              dividor(),
              TextField(
                  decoration: InputDecoration(
                      labelText: 'insert coeficents',
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
                      helperText: 'Insert coeficents of square equation',
                      hoverColor: settings.dark
                          ? settings.secondcold
                          : settings.secondcoll,
                      hintText: 'Insert coeficents of square equation'),
                  onSubmitted: (a) => equation(a)),
              Text(
                'X1: $sqrtx1',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'X2: $sqrtx2',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        )));
  }
}
