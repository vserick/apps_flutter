import 'package:app_futebol/injector.dart';
import 'package:app_futebol/launcher.dart';
import 'package:app_futebol/theme/color_scheme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorApp.primary,
            secondary: ColorApp.secondary,
            tertiary: ColorApp.tertiary,
            error: ColorApp.error,
            surface: ColorApp.surface,
          ),
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(ColorApp.tertiary))),
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Color.fromARGB(83, 240, 238, 205),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              labelStyle: TextStyle(color: ColorApp.tertiary),
              floatingLabelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.tertiary),
              prefixIconColor: ColorApp.tertiary,
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorApp.tertiary),
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
          iconTheme:
              const IconThemeData(color: ColorApp.surface)),
      home: const Launcher(),
    );
  }
}
