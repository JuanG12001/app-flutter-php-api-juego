import 'package:flutter/material.dart';
import 'user_state.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BombasJuego extends StatefulWidget {
  @override
  _BombasJuegoState createState() => _BombasJuegoState();
}

class _BombasJuegoState extends State<BombasJuego> {
  List<Pregunta> preguntas = [];

  @override
 void initState() {
  super.initState();
  obtenerPreguntas();
}

Future<void> obtenerPreguntas() async {
  try {
   final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/obtener-preguntas'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var preguntaJson in data) {
        Pregunta pregunta = Pregunta.fromJson(preguntaJson);
        preguntas.add(pregunta);
      }
      setState(() {});
    } else {
      // Manejar errores de respuesta del servidor
      print('Error en la respuesta del servidor: ${response.statusCode}');
    }
  } catch (e) {
    // Manejar errores de conexión o solicitud HTTP
    print('Error de conexión o solicitud HTTP: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context);
    bool isAdmin = userState.isAdmin;
    return Scaffold(
      backgroundColor: Color(0xFFCE3333),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/R.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 115,
            left: 50,
            right: 190,
            child: Image.asset(
              'assets/images/impugnar.png',
            ),
          ),
          Positioned(
            top: 120,
            left: 25,
            child: Image.asset(
              'assets/images/cam.png',
            ),
          ),
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            right: 19,
            child: Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFF94848),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
            ),
          ),
          Positioned(
  top: 220,
  left: 15,
  child: Container(
    width: 350,
    height: 120,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Center(
      child: Text(
        preguntas.isNotEmpty ? preguntas[0].pregunta : '', // Mostrar la primera pregunta de la lista
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
  ),
),
Positioned(
  top: 350,
  left: 30,
  child: GestureDetector(
    onTap: () {
      // Lógica para manejar la respuesta cuando se presione el botón
    },
    child: Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          preguntas.isNotEmpty ? preguntas[0].respuesta1 : '', // Mostrar la primera respuesta en el botón
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
  ),
),
Positioned(
  top: 410,
  left: 30,
  child: GestureDetector(
    onTap: () {
      // Lógica para manejar la respuesta cuando se presione el botón
    },
    child: Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          preguntas.isNotEmpty ? preguntas[0].respuesta2 : '', // Mostrar la segunda respuesta en el botón
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
  ),
),
Positioned(
  top: 470,
  left: 30,
  child: GestureDetector(
    onTap: () {
      // Lógica para manejar la respuesta cuando se presione el botón
    },
    child: Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          preguntas.isNotEmpty ? preguntas[0].respuesta3 : '', // Mostrar la tercera respuesta en el botón
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
  ),
),
Positioned(
  top: 525,
  left: 30,
  child: GestureDetector(
    onTap: () {
      // Lógica para manejar la respuesta cuando se presione el botón
    },
    child: Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          preguntas.isNotEmpty ? preguntas[0].respuesta4 : '', // Mostrar la cuarta respuesta en el botón
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
  ),
),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Rectangle 20.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 12,
            right: 15,
            left: 180,
            child: Image.asset(
              'assets/images/siguiente.png',
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Container(
              width: 160,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFBF2121),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  'Finalizar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Pregunta {
  int id;
  String pregunta;
  String respuesta1;
  String respuesta2;
  String respuesta3;
  String respuesta4;
  int respuestaCorrecta;

  Pregunta({
    required this.id,
    required this.pregunta,
    required this.respuesta1,
    required this.respuesta2,
    required this.respuesta3,
    required this.respuesta4,
    required this.respuestaCorrecta,
  });

  factory Pregunta.fromJson(Map<String, dynamic> json) {
    return Pregunta(
      id: json['id'],
      pregunta: json['pregunta'],
      respuesta1: json['respuesta1'],
      respuesta2: json['respuesta2'],
      respuesta3: json['respuesta3'],
      respuesta4: json['respuesta4'],
      respuestaCorrecta: json['respuesta_correcta'],
    );
  }
}