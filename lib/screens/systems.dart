import 'package:flutter/material.dart';
import '../models/settings_model.dart' as settings;
import 'dart:math';

class SystemsInf extends StatefulWidget {
  const SystemsInf({Key? key}) : super(key: key);

  @override
  _SystemsInfState createState() => _SystemsInfState();
}

class _SystemsInfState extends State<SystemsInf> {
  @override
  final x = TextEditingController();
  final y = TextEditingController();
  String result = "";
  String answer = " ";
  String answer1 = "";
  String answer2 = "";
  String answertomath = "";
  final List alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  final z = TextEditingController();

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s) != null;
  }

  List toten(a, base) {
    List ans1 = [];
    List ans2 = [];
    double res = 0;
    List n = a.split('.');
    List n1 = n[0].split('');
    bool closer = false;
    List n2 = [];
    try {
      n2 = n[1].split('');
    } catch (e) {
      closer = true;
    }

    for (int i = 0; i < n1.length; i++) {
      try {
        res += int.parse(n1[i]) * pow(int.parse(base), n1.length - i - 1);
        ans1.add(int.parse(n1[i]) * pow(int.parse(base), n1.length - i - 1));
      } catch (e) {
        res += (alphabet.indexOf(n1[i]) + 10) *
            pow(int.parse(base), n1.length - i - 1);
        ans1.add((alphabet.indexOf(n1[i]) + 10) *
            pow(int.parse(base), n1.length - i - 1));
      }
    }
    if (!closer) {
      for (int i = 0; i < n2.length; i++) {
        try {
          res += int.parse(n2[i]) * pow(int.parse(base), -i - 1);
          ans1.add(int.parse(n2[i]) * pow(int.parse(base), -i - 1));
        } catch (e) {
          res += (alphabet.indexOf(n2[i]) + 10) * pow(int.parse(base), -i - 1);
          ans1.add(
              (alphabet.indexOf(n2[i]) + 10) * pow(int.parse(base), -i - 1));
        }
      }
    }
    return [res, ans1, ans2];
  }

  List fromtentoidk(a, base) {
    double res = a[0];
    List ans1 = a[1];
    List ans2 = a[2];
    int b = res.floor();
    String ans = "";
    while (b ~/ int.parse(base) != 0) {
      ans += b % int.parse(base) < 10
          ? (b % int.parse(base)).toString()
          : alphabet[b % int.parse(base) ~/ 1 - 10];
      b ~/= int.parse(base);
      ans2.add(b);
    }
    ans += b.toString();
    ans = ans.split('').reversed.join();
    ans += ".";
    double c = res;
    for (int i = 0; i < 5; i++) {
      c %= 1;
      c *= int.parse(base);
      ans += c % 1 < 10 ? c.toString()[0] : alphabet[c ~/ 1] - 10;
      try {
        if ((c * int.parse(base)).toString()[1] == "0") {
          ans += "0";
        }
      } catch (e) {
        print(e);
      }
      ans2.add(c);
    }
    print(ans);
    return [ans, ans1, ans2];
  }

  void calc(a) {
    a = toten(a, x.text);
    List b = fromtentoidk(a, y.text);
    setState(() {
      result = a[0].toStringAsFixed(5);
      try {
        answer = double.parse(b[0]).toStringAsFixed(5);
      } catch (e) {
        answer = b[0];
      }
      answer1 = b[1].toString();
      answer2 = b[2].toString();
    });
  }

  void solve(a) {
    a = a.split(' ');
    double x = toten(a[0], z.text)[0];
    double y = toten(a[2], z.text)[0];
    String symbol = a[1];
    double n = 0;
    if (symbol == '/') {
      try {
        n = x / y;
      } catch (e) {
        answertomath = e.toString();
      }
    } else if (symbol == '*') {
      n = x * y;
    } else if (symbol == '-') {
      n = x - y;
    } else {
      n = x + y;
    }
    List res = fromtentoidk([n, [], []], z.text);
    setState(() {
      answertomath = res[0].toString();
    });
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

  Widget build(BuildContext context) {
    return Theme(
      data: settings.dark ? settings.darkTheme : settings.lightTheme,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width) * 0.15,
                      child: TextField(
                          decoration: InputDecoration(
                              labelText: "base",
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
                              helperText: 'sys1',
                              hoverColor: settings.dark
                                  ? settings.secondcold
                                  : settings.secondcoll,
                              hintText: 'sys1'),
                          controller: x,
                          onSubmitted: (a) => (a)),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width) * 0.15,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "base",
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
                            helperText: 'sys2',
                            hoverColor: settings.dark
                                ? settings.secondcold
                                : settings.secondcoll,
                            hintText: 'sys2'),
                        onSubmitted: (a) => (a),
                        controller: y,
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width) * 0.5,
                      child: TextField(
                          decoration: InputDecoration(
                              labelText: "number",
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
                              helperText: 'number',
                              hoverColor: settings.dark
                                  ? settings.secondcold
                                  : settings.secondcoll,
                              hintText: 'number'),
                          onSubmitted: (a) => calc(a)),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "result in 10:\n$result",
                          style: TextStyle(fontSize: 32),
                        ),
                        dividor(),
                        Text(
                          "answer:\n$answer",
                          style: TextStyle(fontSize: 32),
                        ),
                        dividor(),
                        Text(
                          "into 10:\n" + answer1,
                          style: TextStyle(fontSize: 32),
                        ),
                        dividor(),
                        Text(
                          "into " + y.text + ":\n" + answer2,
                          style: TextStyle(fontSize: 32),
                        )
                      ])),
              dividor(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width) * 0.15,
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: "base",
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
                            helperText: 'sys',
                            hoverColor: settings.dark
                                ? settings.secondcold
                                : settings.secondcoll,
                            hintText: 'sys'),
                        controller: z,
                        onSubmitted: (a) => (a)),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width) * 0.7,
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: "number",
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
                            helperText: 'number',
                            hoverColor: settings.dark
                                ? settings.secondcold
                                : settings.secondcoll,
                            hintText: 'number'),
                        onSubmitted: (a) => solve(a)),
                  ),
                ],
              ),
              Text('result: $answertomath'),
              Padding(padding: EdgeInsets.all(30))
            ],
          ),
        ),
      ),
    );
  }
}
