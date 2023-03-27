import 'package:flutter/material.dart';
import 'package:login_page/pg/inicio/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iniciar Sesion',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Inicio de Sesion',
            style: TextStyle(fontSize: 25.0),
          ),
          backgroundColor: Colors.black,
        ),
        body: const LoginPage(),
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
