import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Theme/Provider/theme_provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  final bool val = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isLightMode,
      onChanged: (val) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(val);
      },
    );
  }
}
