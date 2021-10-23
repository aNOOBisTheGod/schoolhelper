import 'package:flutter/material.dart';
import 'settings_model.dart' as settings;
import 'package:animated_text_kit/animated_text_kit.dart';

Widget themedtextfield(function, label, helper, hint) {
  return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: settings.dark ? settings.secondcold : settings.secondcoll),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: settings.dark ? settings.themecold : settings.themecoll,
                width: 5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    settings.dark ? settings.secondcold : settings.secondcoll,
                width: 3.0),
          ),
          helperText: helper,
          hoverColor: settings.dark ? settings.secondcold : settings.secondcoll,
          hintText: hint),
      onSubmitted: (a) => function(a));
}

Widget beutyresult(text) {
  return SizedBox(
    width: 250.0,
    child: TypewriterAnimatedTextKit(
      text: [text],
      textStyle: TextStyle(fontSize: 30.0, fontFamily: "Horizon"),
    ),
  );
}
