import 'package:flutter/material.dart';
import 'package:mundial/vista/ventanaLogin.dart';
import 'package:mundial/vista/ventanaPrincipal.dart';
import 'package:mundial/vista/ventanaRegistrar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TALLER MECANICO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const MyHomePageVentanaLogin(title: "Mundial - Login"),
        '/registro': (context) =>
            const MyHomeVentanaRegistro(title: "Mundial - Registro"),
        '/principal': (context) =>
            const VentanaPrincipal(), // Ruta del sistema principal
      },
    );
  }
}
