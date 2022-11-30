import "package:flutter/material.dart";
import "package:flutter_state_notifier/flutter_state_notifier.dart";
import "package:provider/provider.dart";

import "package:qr_scanner/db.dart";
import "package:qr_scanner/theme/theme.dart";
import "package:qr_scanner/providers/providers.dart";
import "package:qr_scanner/pages/pages.dart";

void main() async {
  await HiveDB.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<PageNotifier, PageState>(
          create: (_) => PageNotifier(),
        ),
        StateNotifierProvider<ScannedNotifier, ScannedState>(
          create: (_) => ScannedNotifier(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: MyTheme.light,
          darkTheme: MyTheme.dark,
          title: "QRtz",
          initialRoute: "home",
          routes: {
            "home": (_) => const HomePage(),
            "map": (_) => const MapPage(),
            "generated": (_) => const GeneratedPage(),
          }),
    );
  }
}
