import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/provider/cart_provider.dart';
import 'package:shopping_provider/provider/product_provider.dart';
import 'package:shopping_provider/screens/main_screen.dart';
import 'package:shopping_provider/themes/theme.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: Themes.light,
      themeMode:  ThemeMode.light,
      home: const MainScreen(),
    );
  }
}
