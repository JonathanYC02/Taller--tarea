// ignore: file_names
import 'package:flutter/material.dart';

class MyHomeVentanaRegistro extends StatefulWidget {
  const MyHomeVentanaRegistro({super.key, required this.title});

  final String title;

  @override
  State<MyHomeVentanaRegistro> createState() => _MyHomeVentanaRegistroState();
}

class _MyHomeVentanaRegistroState extends State<MyHomeVentanaRegistro> {
  String nombre = "";
  String correo = "";
  String clave = "";
  String confirmarClave = "";

  final Color cianNeon = const Color(0xFF4DEEEA);
  final Color azulOscuroFondo = const Color(0xFF0D1B2A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              width: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_1_rounded,
                    size: 70,
                    color: cianNeon,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "CREAR CUENTA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      shadows: [Shadow(color: cianNeon, blurRadius: 10)],
                    ),
                  ),
                  const SizedBox(height: 35),

                  // Nombre Completo
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: _crearInputDecoration(
                      "Nombre completo",
                      Icons.person_outline,
                    ),
                    onChanged: (value) => nombre = value,
                  ),
                  const SizedBox(height: 20),

                  // Correo
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: _crearInputDecoration(
                      "Correo electrónico",
                      Icons.email_outlined,
                    ),
                    onChanged: (value) => correo = value,
                  ),
                  const SizedBox(height: 20),

                  // Contraseña
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: _crearInputDecoration(
                      "Contraseña",
                      Icons.lock_outline,
                    ),
                    onChanged: (value) => clave = value,
                  ),
                  const SizedBox(height: 20),

                  // Confirmar Contraseña
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: _crearInputDecoration(
                      "Confirmar contraseña",
                      Icons.lock_reset_rounded,
                    ),
                    onChanged: (value) => confirmarClave = value,
                  ),
                  const SizedBox(height: 35),

                  // Botón Registrarme
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cianNeon,
                        foregroundColor: azulOscuroFondo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        shadowColor: cianNeon.withValues(alpha: 0.5),
                      ),
                      onPressed: validarRegistro,
                      child: const Text(
                        "REGISTRARME",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "¿Ya tienes cuenta? Inicia sesión",
                      style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.underline,
                        decorationColor: cianNeon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _crearInputDecoration(String texto, IconData icono) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.black45,
      prefixIcon: Icon(icono, color: cianNeon),
      labelText: texto,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white38, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: cianNeon, width: 2.0),
      ),
    );
  }

  void validarRegistro() {
    if (nombre.isEmpty ||
        correo.isEmpty ||
        clave.isEmpty ||
        confirmarClave.isEmpty) {
      _mostrarAlerta("Error", "Por favor, rellene todos los campos.");
      return;
    }

    if (clave != confirmarClave) {
      _mostrarAlerta("Error", "Las contraseñas introducidas no coinciden.");
      return;
    }

    _mostrarAlerta(
      "Registro Exitoso",
      "¡Tu cuenta ha sido creada correctamente!",
    );
  }

  void _mostrarAlerta(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A2639),
          title: Text(titulo, style: const TextStyle(color: Colors.white)),
          content: Text(mensaje, style: const TextStyle(color: Colors.white70)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
                if (titulo == "Registro Exitoso") {
                  // ¡AQUÍ ESTÁ LA MAGIA! Devolvemos los datos del nuevo usuario al Login
                  Navigator.pop(context, {
                    'correo': correo.trim(),
                    'clave': clave,
                  });
                }
              },
              child: Text("Aceptar", style: TextStyle(color: cianNeon)),
            ),
          ],
        );
      },
    );
  }
}
