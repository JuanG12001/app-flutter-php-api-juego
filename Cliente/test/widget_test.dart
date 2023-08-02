import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Prueba de incremento del contador', (WidgetTester tester) async {
    // Construir nuestra aplicación y activar un frame.
    await tester.pumpWidget(MaterialApp(home: MyApp())); // Envolver MyApp con MaterialApp

    // Aquí puedes agregar las pruebas específicas para el incremento del contador
    // utilizando las funciones de prueba proporcionadas por el paquete de pruebas de Flutter.

    // Ejemplo de una prueba que verifica el incremento del contador
    var contador = 0;
    expect(contador, 0); // Verificar que el contador inicial sea 0
    contador++;
    expect(contador, 1); // Verificar que el contador se haya incrementado a 1
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi aplicación'),
      ),
      body: Container(),
    );
  }
}
