import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class DarkThemScreen extends StatefulWidget {
  const DarkThemScreen({super.key});

  @override
  State<DarkThemScreen> createState() => _DarkThemScreenState();
}

class _DarkThemScreenState extends State<DarkThemScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Change"),
      ),
      body: Column(
        children: [
          RadioListTile(
              title: const Text("ligt theme"),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme),
          RadioListTile(
              title: const Text("dark theme"),
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme),
          RadioListTile(
              title: const Text("system theme"),
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme),
          const Icon(Icons.favorite)
        ],
      ),
    );
  }
}
