import 'package:flutter/material.dart';
import 'package:myapp/provider/auth_provider.dart';
import 'package:myapp/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

import 'provider/theme_changer_provider.dart';
import 'screens/value_notifiy_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavouriteIemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            title: "Provider Practices",
            theme: ThemeData(
              primarySwatch: Colors.red,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.amber,
                appBarTheme: const AppBarTheme(color: Colors.teal),
                iconTheme: const IconThemeData(color: Colors.red)),
            debugShowCheckedModeBanner: false,
            home: NotifyListnerScreen(),
          );
        }));
  }
}
