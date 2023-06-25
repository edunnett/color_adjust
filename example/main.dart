import 'package:color_adjust/color_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Color baseColor = Colors.blue;
  Color mixColor = Colors.pink;
  late Color tempColor;
  TextStyle textLight = const TextStyle(color: Colors.white);
  TextStyle textDark = const TextStyle(color: Colors.black);

  void changeColor(Color color) {
    setState(() {
      tempColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Adjust Examples"),
      ),
      body: Column(
        children: [
          Wrap(
            runSpacing: 10,
            spacing: 10,
            runAlignment: WrapAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: baseColor),
                child: Text(
                  'Select Base Color',
                  style: baseColor.isBright ? textDark : textLight,
                ),
                onPressed: () {
                  tempColor = baseColor;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Pick a color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: tempColor,
                            onColorChanged: changeColor,
                            colorPickerWidth: 300.0,
                            pickerAreaHeightPercent: 0.7,
                            enableAlpha: true,
                            displayThumbColor: true,
                            paletteType: PaletteType.hsv,
                            pickerAreaBorderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(2.0),
                              topRight: Radius.circular(2.0),
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Got it'),
                            onPressed: () {
                              setState(() {
                                baseColor = tempColor;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: mixColor),
                child: Text(
                  'Select Mix Color',
                  style: mixColor.isBright ? textDark : textLight,
                ),
                onPressed: () {
                  tempColor = mixColor;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Pick a color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: tempColor,
                            onColorChanged: changeColor,
                            colorPickerWidth: 300.0,
                            pickerAreaHeightPercent: 0.7,
                            enableAlpha: true,
                            displayThumbColor: true,
                            paletteType: PaletteType.hsv,
                            pickerAreaBorderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(2.0),
                              topRight: Radius.circular(2.0),
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Got it'),
                            onPressed: () {
                              setState(() {
                                mixColor = tempColor;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: getList(),
          ),
        ],
      ),
    );
  }

  Widget getList() {
    return ListView(
      children: <Widget>[
        Builder(builder: (context) {
          return Row(
            children: [
              Expanded(
                child: Container(
                    color: baseColor.mix(mixColor, 0.5),
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      "Mix Default",
                      style: baseColor.mix(mixColor, 0.5).isDark
                          ? textLight
                          : textDark,
                    )),
              ),
              Expanded(
                child: Container(
                    color: baseColor.mix(mixColor, 0.25),
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      "Mix 25%",
                      style: baseColor.mix(mixColor, 0.25).isDark
                          ? textLight
                          : textDark,
                    )),
              ),
              Expanded(
                child: Container(
                    color: baseColor.mix(mixColor, 0.75),
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      "Mix 75%",
                      style: baseColor.mix(mixColor, 0.75).isDark
                          ? textLight
                          : textDark,
                    )),
              ),
            ],
          );
        }),
        Builder(builder: (context) {
          return Row(
            children: [
              Expanded(
                child: Container(
                    color: baseColor.blend(mixColor),
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      "Blend Default",
                      style: baseColor.blend(mixColor).isDark
                          ? textLight
                          : textDark,
                    )),
              ),
              Expanded(
                child: Container(
                    color: baseColor.blend(mixColor, .25),
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      "Blend 25%",
                      style: baseColor.blend(mixColor, .25).isDark
                          ? textLight
                          : textDark,
                    )),
              ),
              Expanded(
                child: Container(
                    color: baseColor.blend(mixColor, .75),
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      "Blend 75%",
                      style: baseColor.blend(mixColor, .75).isDark
                          ? textLight
                          : textDark,
                    )),
              ),
            ],
          );
        }),
        Builder(builder: (context) {
          final Color darkened = baseColor.darken(0.2);
          return Container(
              color: darkened,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                "Darkened",
                style: darkened.isDark ? textLight : textDark,
              ));
        }),
        Builder(builder: (context) {
          final Color lightened = baseColor.lighten(0.2);
          return Container(
              color: lightened,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                "Lightened",
                style: lightened.isDark ? textLight : textDark,
              ));
        }),
        Builder(builder: (context) {
          final Color inverted = baseColor.invert();
          return Container(
              color: inverted,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                "Inverted",
                style: inverted.isDark ? textLight : textDark,
              ));
        }),
        Builder(builder: (context) {
          final Color desaturated = baseColor.desaturate(.5);
          return Container(
              color: desaturated,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                "Desaturated",
                style: desaturated.isDark ? textLight : textDark,
              ));
        }),
        Builder(builder: (context) {
          final Color saturated = baseColor.saturate(.5);
          return Container(
              color: saturated,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                "Saturated",
                style: saturated.isDark ? textLight : textDark,
              ));
        }),
        Builder(builder: (context) {
          final Color complimented = baseColor.compliment();
          return Container(
              color: complimented,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                "Complimented",
                style: complimented.isDark ? textLight : textDark,
              ));
        }),
        Builder(builder: (context) {
          final Color whitened = baseColor.whiten(0.5);
          return Container(
              color: whitened,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                "Whitened",
                style: whitened.isDark ? textLight : textDark,
              ));
        }),
        Builder(builder: (context) {
          final Color toned = baseColor.tone(0.5);
          return Container(
              color: toned,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                "Toned",
                style: toned.isDark ? textLight : textDark,
              ));
        }),
        Builder(builder: (context) {
          final Color blackened = baseColor.blacken(0.5);
          return Container(
              color: blackened,
              alignment: Alignment.center,
              height: 50,
              child: Text(
                "Blackened",
                style: blackened.isDark ? textLight : textDark,
              ));
        }),
      ],
    );
  }
}
