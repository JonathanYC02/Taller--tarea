// ignore: file_names
import 'package:flutter/material.dart';

class MyHomePageVentanaLogin extends StatefulWidget {
  const MyHomePageVentanaLogin({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageVentanaLogin> createState() => _MyHomePageVentanaLogin();
}

class _MyHomePageVentanaLogin extends State<MyHomePageVentanaLogin> {
  String correo = "";
  String clave = "";

  // Variables dinámicas para almacenar el usuario que se registre en la app
  String usuarioRegistrado = "";
  String claveRegistrada = "";

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: SizedBox(
              width: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tarjeta de Integrantes
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: cianNeon.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.terminal_rounded,
                              color: cianNeon,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "GRUPO 10",
                              style: TextStyle(
                                color: cianNeon,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.white12, height: 15),
                        const Text(
                          "• CASTRO AVILA JONATHAN XAVIER\n"
                          "• ESTRADA MOLINA DERECK DOUGLAS\n"
                          "• YUMISACA CHICAIZA JONATHAN STEEVEN\n"
                          "• SOLEDISPA PAULA XAVIER MOISES\n"
                          "• ROBLES MORALES JUAN ANDRES",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            height: 1.6,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Icon(Icons.lock_open_rounded, size: 70, color: cianNeon),
                  const SizedBox(height: 10),
                  Text(
                    "BIENVENIDO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      shadows: [Shadow(color: cianNeon, blurRadius: 10)],
                    ),
                  ),
                  const SizedBox(height: 35),

                  // Campo Correo
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: _inputStyle(
                      "Correo electrónico",
                      Icons.email_outlined,
                    ),
                    onChanged: (value) => correo = value,
                  ),
                  const SizedBox(height: 20),

                  // Campo Contraseña
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: _inputStyle("Contraseña", Icons.lock_outline),
                    onChanged: (value) => clave = value,
                  ),
                  const SizedBox(height: 35),

                  // Botón INGRESAR
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
                      onPressed: validarInisioSesion,
                      child: const Text(
                        "INGRESAR",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Botón REGISTRARSE
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: cianNeon,
                        side: BorderSide(color: cianNeon, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        print("Va a registrar un nuevo usuario");

                        // Esperamos a que la ventana de registro devuelva los datos creados
                        final resultado = await Navigator.pushNamed(
                          context,
                          '/registro',
                        );

                        // Si el usuario efectivamente completó el registro, guardamos sus datos localmente
                        if (resultado != null && resultado is Map) {
                          setState(() {
                            usuarioRegistrado = resultado['correo'];
                            claveRegistrada = resultado['clave'];
                          });
                          print(
                            "Usuario temporal registrado con éxito: $usuarioRegistrado",
                          );
                        }
                      },
                      child: const Text(
                        "REGISTRARSE",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
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

  InputDecoration _inputStyle(String texto, IconData icono) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.black45,
      prefixIcon: Icon(icono, color: cianNeon),
      labelText: texto,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white38),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: cianNeon, width: 2.0),
      ),
    );
  }

  void validarInisioSesion() {
    if (correo.isEmpty || clave.isEmpty) {
      _mostrarAlerta("Error", "Debe completar todos los campos");
      return;
    }

    String correoIngresado = correo.trim();

    // Ahora valida contra el estático Y CONTRA EL QUE SE ACABA DE REGISTRAR
    if ((correoIngresado == "jonathan@gmail.com" && clave == "1234") ||
        (usuarioRegistrado.isNotEmpty &&
            correoIngresado == usuarioRegistrado &&
            clave == claveRegistrada)) {
      print("Acceso concedido");
      Navigator.pushReplacementNamed(context, '/principal');
    } else {
      print("Acceso Negado");
      _mostrarAlerta("Error", "Acceso Negado. Credenciales incorrectas.");
    }
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
              onPressed: () => Navigator.pop(context),
              child: Text("Aceptar", style: TextStyle(color: cianNeon)),
            ),
          ],
        );
      },
    );
  }
}
