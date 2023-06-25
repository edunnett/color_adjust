# `color_adjust` Flutter Extension Documentation

The `color_adjust` is an extension on the Flutter Color class that provides a collection of color manipulation methods.

## Usage

To use these methods, you need to import the `color_adjust` extension and apply these methods on a Color object.

![Screenshot of Example](https://github.com/edunnett/color_adjust/raw/main/assets/screenshot.png)

Example:

```dart
import 'package:color_adjust/color_adjust.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = Colors.blue;
    Color mixColor = Colors.pink;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Color Adjust Examples"),
        ),
        body: ListView(
          children: <Widget>[
            Container(color: baseColor, height: 50),
            Container(color: baseColor.darken(0.2), height: 50),
            Container(color: baseColor.lighten(0.2), height: 50),
            Container(color: baseColor.invert(), height: 50),
            Container(color: baseColor.compliment(), height: 50),
            Container(color: baseColor.desaturate(0.2), height: 50),
            Container(color: baseColor.saturate(0.2), height: 50),
            Container(color: baseColor.mix(mixColor, 0.5), height: 50),
            Container(color: baseColor.whiten(0.5), height: 50),
            Container(color: baseColor.tone(0.5), height: 50),
            Container(color: baseColor.blacken(0.5), height: 50),
          ],
        ),
      ),
    );
  }
}

```

## Methods

The extension adds the following methods:

- **`darken([double amount = .5])`**: Darkens the color by the provided amount (0-1), defaulting to 50%.
- **`lighten([double amount = .5])`**: Lightens the color by the provided amount (0-1), defaulting to 50%.
- **`invert()`**: Inverts a color, producing its "negative". It does not preserve lightness. If you want to do that, use the `compliment` method.
- **`compliment()`**: Gets the complimentary (opposite on the color wheel) of a color. This is like inverting, however it keeps the same lightness value.
- **`desaturate([double amount = .5])`**: Desaturates a color by the provided amount (0-1), defaulting to 50%.
- **`saturate([double amount = .5])`**: Saturates a color by the provided amount (0-1), defaulting to 50%.
- **`mix(Color another, [double amount = 0.5])`**: Mixes a color with another one by the provided amount (0-1), defaulting to 50%.
- **`whiten([double amount = 0.5])`**: Whitens a color by mixing it with white by the provided amount (0-1), defaulting to 50%.
- **`tone([double amount = 0.5])`**: Tones down a color by mixing it with grey by the provided amount (0-1), defaulting to 50%.
- **`blacken([double amount = 0.5])`**: Blackens a color by mixing it with black by the provided amount (0-1), defaulting to 50%.
- **`isDark`**: Checks if a color is considered dark using the luminance.
- **`isBright`**: Checks if a color is considered bright.
