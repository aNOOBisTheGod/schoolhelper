import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/model/screen_hidden_drawer.dart';
import 'package:rng/screens/chemist.dart';
import 'package:rng/screens/ranshit.dart';
import 'package:rng/screens/systems.dart';
import './screens/gcd.dart';
import './screens/home.dart';
import './screens/settings.dart';
import 'models/settings_model.dart' as setting;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Spantaran',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ScreenHiddenDrawer> itens = [];

  @override
  void initState() {
    itens.add(new ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: !setting.coinflip ? "Random Number" : "Coinflip Mode",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: TextStyle(color: Colors.white),
        ),
        HomePage()));

    itens.add(new ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Settings",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: TextStyle(color: Colors.white),
        ),
        SettingsScreen()));
    itens.add(new ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Math stuff",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: TextStyle(color: Colors.white),
        ),
        MathScreen()));
    itens.add(new ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Systems",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: TextStyle(color: Colors.white),
        ),
        SystemsInf()));
    itens.add(new ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Chemist",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: TextStyle(color: Colors.white),
        ),
        ChemistScreen()));

    itens.add(new ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Random stuff",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: TextStyle(color: Colors.white),
        ),
        Randomshit()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Color.fromRGBO(17, 57, 81, 1),
      backgroundColorAppBar: Colors.black,
      screens: itens,
      isDraggable: true,
      withShadow: true,

      //    typeOpen: TypeOpen.FROM_RIGHT,
      //    disableAppBarDefault: false,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      slidePercent: 80.0,
      //    verticalScalePercent: 80.0,
      //    contentCornerRadius: 10.0,
      //    iconMenuAppBar: Icon(Icons.menu),
      // backgroundContent: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //    backgroundColorContent: Colors.blue,
      //    elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      backgroundMenu: DecorationImage(
          image: AssetImage('assets/images/bg_news.png'), fit: BoxFit.cover),
    );
  }
}
