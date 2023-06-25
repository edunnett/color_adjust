import 'package:flutter/material.dart';

// Extension on Color to add color manipulation methods
extension Adjust on Color {
  // Darken a color by the provided amount (0-1), defaulting to 50%
  Color darken([double amount = .5]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this); // convert to HSL
    // darken by reducing lightness
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor(); // convert back to Color
  }

  // Lighten a color by the provided amount (0-1), defaulting to 50%
  Color lighten([double amount = .5]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this); // convert to HSL
    // lighten by increasing lightness
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor(); // convert back to Color
  }

  // Invert a color (producing its "negative")
  // This will not preserve lightness. If you want to do that, use compliment
  // to convert to HSL, invert the hue, and convert back to RGB.
  Color invert() {
    final r = (255 - red).clamp(0, 255);
    final g = (255 - green).clamp(0, 255);
    final b = (255 - blue).clamp(0, 255);
    return Color.fromARGB((opacity * 255).round(), r, g, b);
  }

  // Get the complimentary (opposite on the color wheel) of a color
  // This is like inverting, however it keeps the same lightness value
  Color compliment() {
    final hsl = HSLColor.fromColor(this); // convert to HSL
    final double newHue =
        (hsl.hue + 180.0) % 360.0; // compute complimentary hue
    final newHsl =
        hsl.withHue(newHue); // create new color with complimentary hue
    return newHsl.toColor(); // convert back to Color
  }

  // Desaturate a color by the provided amount (0-1), defaulting to 50%
  Color desaturate([double amount = .5]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this); // convert to HSL
    // desaturate by reducing saturation
    final hslDesaturated =
        hsl.withSaturation((hsl.saturation - amount).clamp(0.0, 1.0));
    return hslDesaturated.toColor(); // convert back to Color
  }

  // Saturate a color by the provided amount (0-1), defaulting to 50%
  Color saturate([double amount = .5]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this); // convert to HSL
    // saturate by increasing saturation
    final hslSaturated =
        hsl.withSaturation((hsl.saturation + amount).clamp(0.0, 1.0));
    return hslSaturated.toColor(); // convert back to Color
  }

  // Mix a color with another one by the provided amount (0-1), defaulting to 50%
  // this might result in a color that looks muddy, as the lightness is not preserved
  // if you want to preserve the lightness, use blend instead
  Color mix(Color another, [double amount = 0.5]) {
    assert(amount >= 0 && amount <= 1);
    // mix by taking a weighted average
    final r = (red * (1 - amount) + another.red * amount).round().clamp(0, 255);
    final g =
        (green * (1 - amount) + another.green * amount).round().clamp(0, 255);
    final b =
        (blue * (1 - amount) + another.blue * amount).round().clamp(0, 255);
    return Color.fromARGB(alpha, r, g, b);
  }

  // Mix a color with another one using HSL color space by the provided amount (0-1), defaulting to 50%
  Color blend(Color another, [double amount = 0.5]) {
    assert(amount >= 0 && amount <= 1);
    final hsl1 = HSLColor.fromColor(this);
    final hsl2 = HSLColor.fromColor(another);
    // mix by taking a weighted average
    final h =
        ((hsl1.hue * (1 - amount)) + (hsl2.hue * amount)).clamp(0.0, 360.0);
    final s = ((hsl1.saturation * (1 - amount)) + (hsl2.saturation * amount))
        .clamp(0.0, 1.0);
    final l = ((hsl1.lightness * (1 - amount)) + (hsl2.lightness * amount))
        .clamp(0.0, 1.0);
    return HSLColor.fromAHSL(
            (hsl1.alpha * (1 - amount)) + (hsl2.alpha * amount), h, s, l)
        .toColor();
  }

  // Whiten a color by mixing it with white by the provided amount (0-1), defaulting to 50%
  Color whiten([double amount = 0.5]) {
    return mix(Colors.white, amount);
  }

  //Tone down a color by mixing it with grey by the provided amount (0-1), defaulting to 50%
  Color tone([double amount = 0.5]) {
    const neutralGrey = Color.fromRGBO(128, 128, 128, 1);
    return mix(neutralGrey, amount);
  }

  // Blacken a color by mixing it with black by the provided amount (0-1), defaulting to 50%
  Color blacken([double amount = 0.5]) {
    return mix(Colors.black, amount);
  }

  // Check if a color is considered dark using the luminance
  bool get isDark {
    // Compute the color luminance
    final double luminance = 0.299 * red + 0.587 * green + 0.114 * blue;
    // Luminance ranges from 0 to 255, we take 128 as a mid-point
    return luminance < 128;
  }

  // Check if a color is considered bright
  bool get isBright {
    // Bright colors are not dark!
    return !isDark;
  }
}
