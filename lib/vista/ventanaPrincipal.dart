// ignore: file_names
import 'package:flutter/material.dart';

class VentanaPrincipal extends StatelessWidget {
  const VentanaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A), // Fondo oscuro a juego
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline_rounded,
              size: 100,
              color: Color(0xFF4DEEEA),
            ),
            const SizedBox(height: 20),
            const Text(
              "SISTEMA PRINCIPAL",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "¡Bienvenido al Mundial!",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4DEEEA),
                foregroundColor: const Color(0xFF0D1B2A),
              ),
              onPressed: () {
                // Permite cerrar sesión y volver de manera segura al login
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text("Cerrar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
