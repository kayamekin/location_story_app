import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:challenge_one/screens/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: const Color.fromARGB(255, 56, 49, 66),
);

final theme = ThemeData().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: colorScheme.background,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.openSansTextTheme().copyWith(
      titleSmall: GoogleFonts.openSans(fontWeight: FontWeight.bold),
      titleLarge: GoogleFonts.openSans(fontWeight: FontWeight.bold),
    ));

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: theme,
      home: const PlacesScreen(),
    );
  }
}
