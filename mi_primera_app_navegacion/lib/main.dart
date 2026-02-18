import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Primera App con Navegación',
      home: const HomeScreen(),
    );
  }
}

/* =======================
   PANTALLA 1 - FORMULARIO
   ======================= */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _goToSecondScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            WelcomeScreen(nombre: _nameController.text),
      ),
    ).then((_) {
      _nameController.clear(); // Extra
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: double.infinity, 
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center, 
              children: [
                Text(
                  'Pantalla de Inicio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Image.asset(
                  'assets/Logo-UTT-Tijuana.png',
                  height: size.height * 0.25,
                ),

                SizedBox(height: size.height * 0.03),

                SizedBox(
                  width: size.width * 0.85,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Escribe tu nombre',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                SizedBox(
                  width: size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: _goToSecondScreen,
                    child: const Text('Continuar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* =======================
   PANTALLA 2 - BIENVENIDA
   ======================= */

class WelcomeScreen extends StatelessWidget {
  final String nombre;

  const WelcomeScreen({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 2'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center, 
              children: [
                Text(
                  'Hola, $nombre',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.065,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Image.asset(
                  'assets/Logo-UTT-Tijuana.png',
                  height: size.height * 0.25,
                ),

                SizedBox(height: size.height * 0.03),

                SizedBox(
                  width: size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Regresar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
