import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BombasScreen extends StatefulWidget {
  @override
  _BombasScreenState createState() => _BombasScreenState();
}

class _BombasScreenState extends State<BombasScreen> {
  final TextEditingController preguntaController = TextEditingController();
  final TextEditingController respuesta1Controller = TextEditingController();
  final TextEditingController respuesta2Controller = TextEditingController();
  final TextEditingController respuesta3Controller = TextEditingController();
  final TextEditingController respuesta4Controller = TextEditingController();

  int? respuestaCorrecta; // Variable para almacenar la respuesta correcta

Future<void> guardarPreguntaRespuestas() async {
  if (respuestaCorrecta == null) {
    print('Selecciona una respuesta correcta');
    return;
  }

  final url = 'http://127.0.0.1:8000/api/guardar-pregunta';
  final response = await http.post(
    Uri.parse(url),
    body: {
      'pregunta': preguntaController.text,
      'respuesta1': respuesta1Controller.text,
      'respuesta2': respuesta2Controller.text,
      'respuesta3': respuesta3Controller.text,
      'respuesta4': respuesta4Controller.text,
      'respuestaCorrecta': respuestaCorrecta.toString(),
    },
  );

  if (response.statusCode == 200) {
    // Pregunta guardada exitosamente
    print('Pregunta guardada correctamente');
  } else {
    // Error al guardar la pregunta
    print('Error al guardar la pregunta');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 71, 71),
      appBar: AppBar(
        title: Text('Hidráulica Bombas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: preguntaController,
              decoration: InputDecoration(
                hintText: 'Pregunta',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: respuesta1Controller,
              decoration: InputDecoration(
                hintText: 'Respuesta 1',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: respuesta2Controller,
              decoration: InputDecoration(
                hintText: 'Respuesta 2',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: respuesta3Controller,
              decoration: InputDecoration(
                hintText: 'Respuesta 3',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: respuesta4Controller,
              decoration: InputDecoration(
                hintText: 'Respuesta 4',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            DropdownButton<int>(
              value: respuestaCorrecta,
              onChanged: (int? newValue) {
                setState(() {
                  respuestaCorrecta = newValue;
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text('Respuesta 1'),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Respuesta 2'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('Respuesta 3'),
                ),
                DropdownMenuItem<int>(
                  value: 3,
                  child: Text('Respuesta 4'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: guardarPreguntaRespuestas,
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}