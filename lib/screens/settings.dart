import 'package:flutter/material.dart';
import '../models/settings_model.dart' as settings;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void changeBorder(String a) {
    setState(() {
      settings.bord = int.parse(a);
    });
  }

  void changestartBorder(String a) {
    setState(() {
      settings.start = int.parse(a);
    });
  }

  void changemod(String a) {
    setState(() {
      settings.mod = int.parse(a);
    });
  }

  void changeColord(x, Color color) {
    setState(() {
      if (x == 0) {
        if (settings.dark) {
          settings.themecold = color;
        } else {
          settings.themecoll = color;
        }
      } else if (x == 1) {
        if (settings.dark) {
          settings.secondcold = color;
        } else {
          settings.secondcoll = color;
        }
      } else {
        settings.thirdcol = color;
      }
    });
  }

  Color currentColor = settings.dark ? settings.themecold : settings.themecoll;
  Color pickerColor = settings.dark ? settings.themecold : settings.themecoll;

  void setcolor(x) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: x == 0
                    ? settings.dark
                        ? settings.themecold
                        : settings.themecoll
                    : x == 1
                        ? settings.dark
                            ? settings.secondcold
                            : settings.secondcoll
                        : settings.thirdcol,
                onColorChanged: (col) => changeColord(x, col),
                showLabel: true,
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    var _selectedIndex = 1;

    Widget dividor() {
      return Container(
        width: (MediaQuery.of(context).size.width) * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: settings.dark ? Colors.grey[600] : Colors.grey[300],
        ),
        height: 5,
      );
    }

    return Theme(
        data: settings.dark ? settings.darkTheme : settings.lightTheme,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: settings.bord.toString(),
                        labelStyle: TextStyle(
                          color: settings.dark
                              ? settings.secondcold
                              : settings.secondcoll,
                        ),
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
                        helperText: 'Insert upper border for random generation',
                        hoverColor: settings.dark
                            ? settings.secondcold
                            : settings.secondcoll,
                        hintText: 'Insert upper border in here'),
                    keyboardType: TextInputType.number,
                    onSubmitted: (a) => changeBorder(a)),
              ),
              dividor(),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: settings.start.toString(),
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
                        helperText: 'Insert bottom border of generation',
                        hoverColor: settings.dark
                            ? settings.secondcold
                            : settings.secondcoll,
                        hintText: 'Insert bottom border in here'),
                    keyboardType: TextInputType.number,
                    onSubmitted: (a) => changestartBorder(a)),
              ),
              dividor(),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: settings.mod.toString(),
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
                        helperText: 'Insert mod of generation',
                        hoverColor: settings.dark
                            ? settings.secondcold
                            : settings.secondcoll,
                        hintText: 'Insert mod in here'),
                    keyboardType: TextInputType.number,
                    onSubmitted: (a) => changemod(a)),
              ),
              dividor(),
              Column(children: [
                Switch(
                  value: settings.even,
                  onChanged: (value) {
                    setState(() {
                      settings.even = value;
                      if (settings.even && settings.odd) {
                        settings.odd = false;
                      }
                    });
                  },
                  activeTrackColor: settings.thirdcol,
                  activeColor:
                      settings.dark ? settings.themecold : settings.themecoll,
                ),
                Text("only even numbers"),
                Switch(
                  value: settings.odd,
                  onChanged: (value) {
                    setState(() {
                      settings.odd = value;
                      if (settings.even && settings.odd) {
                        settings.even = false;
                      }
                    });
                  },
                  activeTrackColor: settings.thirdcol,
                  activeColor:
                      settings.dark ? settings.themecold : settings.themecoll,
                ),
                Text("only odd numbers"),
                Switch(
                  value: settings.usemod,
                  onChanged: (value) {
                    setState(() {
                      settings.usemod = value;
                    });
                  },
                  activeTrackColor: settings.thirdcol,
                  activeColor:
                      settings.dark ? settings.themecold : settings.themecoll,
                ),
                Text("Enable mod"),
                Switch(
                  value: settings.coinflip,
                  onChanged: (a) {
                    setState(() {
                      settings.coinflip = a;
                    });
                  },
                  activeTrackColor: settings.thirdcol,
                  activeColor:
                      settings.dark ? settings.themecold : settings.themecoll,
                ),
                Text("Enable coinflip mode"),
                Padding(padding: EdgeInsets.all(10)),
                dividor(),
                Switch(
                  value: settings.dark,
                  onChanged: (a) {
                    setState(() {
                      settings.dark = a;
                    });
                  },
                  activeTrackColor: settings.thirdcol,
                  activeColor:
                      settings.dark ? settings.themecold : settings.themecoll,
                ),
                Text("Enable dark theme"),
                Padding(padding: EdgeInsets.all(20)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Padding(padding: EdgeInsets.all(30)),
                //     FloatingActionButton(
                //         onPressed: () => setcolor(0),
                //         backgroundColor: settings.dark
                //             ? settings.themecold
                //             : settings.themecoll,
                //         child: Icon(Icons.color_lens)),
                //     FloatingActionButton(
                //       onPressed: () => setcolor(1),
                //       backgroundColor: settings.dark
                //           ? settings.secondcold
                //           : settings.secondcoll,
                //       child: Icon(Icons.color_lens),
                //     ),
                //     FloatingActionButton(
                //       onPressed: () => setcolor(2),
                //       backgroundColor: settings.thirdcol,
                //       child: Icon(Icons.color_lens),
                //     ),
                //     Padding(padding: EdgeInsets.all(30)),
                //   ],
                // ),
              ]),
            ]),
          ),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor:
                settings.dark ? settings.themecold : settings.themecoll,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.color_lens),
                  onTap: () => setcolor(0),
                  backgroundColor:
                      settings.dark ? settings.themecold : settings.themecoll,
                  onLongPress: () => changeColord(
                      0,
                      settings.dark
                          ? Color.fromRGBO(33, 42, 51, 1)
                          : Colors.teal)),
              SpeedDialChild(
                  child: Icon(Icons.color_lens),
                  onTap: () => setcolor(1),
                  backgroundColor:
                      settings.dark ? settings.secondcold : settings.secondcoll,
                  onLongPress: () => changeColord(
                      1, settings.dark ? Colors.orange : Colors.amber)),
              SpeedDialChild(
                  child: Icon(Icons.color_lens),
                  onTap: () => setcolor(2),
                  backgroundColor: settings.thirdcol,
                  onLongPress: () => changeColord(2, Colors.red))
            ],
          ),
          bottomSheet: Padding(padding: EdgeInsets.only(bottom: 100.0)),
        ));
  }
}
