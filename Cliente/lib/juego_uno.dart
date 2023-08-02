import 'package:flutter/material.dart';
import 'sintablero.dart';
import 'user_state.dart';
import 'package:provider/provider.dart';
import 'bombas.dart'; 
import 'preguntas.dart'; 

class Juego_Uno extends StatefulWidget {
  @override
  _Juego_UnoState createState() => _Juego_UnoState();
}

class _Juego_UnoState extends State<Juego_Uno> {
  int botonSeleccionado = 0;

  void ostrarVentanaEmergente() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Elige una opción'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Aquí puedes anotar tus preguntas'),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        botonSeleccionado = 1;
                      });
                      Navigator.of(context).pop();
                      if (botonSeleccionado == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BombasScreen()),
                        );
                      }
                    },
                    child: Text('bombas'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        botonSeleccionado = 2;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('extintores'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        botonSeleccionado = 3;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('juridico'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        botonSeleccionado = 4;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Vehi y Herra'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        botonSeleccionado = 5;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Fuego'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        botonSeleccionado = 6;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Instalaciones'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        botonSeleccionado = 7;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Mix'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context);
    bool isAdmin = userState.isAdmin;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 71, 71),
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Elige una categoría',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 290,
            left: 0,
            child: Image.asset(
              'assets/images/Rectangle 20.png',
              width: 375,
              height: 680,
            ),
          ),
Positioned(
  top: 600,
  left: 0,
  right: 15,
  child: GestureDetector(
    onTap: () {
      if (botonSeleccionado == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BombasJuego()),
        );
      } else if (botonSeleccionado == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BombasJuego()),
        );
      } else if (botonSeleccionado == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BombasJuego()),
        );
      } else if (botonSeleccionado == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BombasJuego()),
        );
      } else if (botonSeleccionado == 5) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BombasJuego()),
        );
      } else if (botonSeleccionado == 6) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BombasJuego()),
        );
      } else if (botonSeleccionado == 7) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BombasJuego()),
        );
      }
    },
    child: Image.asset(
      'assets/images/jugar.png',
      width: 400,
      height: 100,
    ),
  ),
),

          Positioned(
            top: 20,
            left: 100,
            child: GestureDetector(
              onTap: isAdmin ? () {
                ostrarVentanaEmergente();
              } : null,
              child: Image.asset(
                'assets/images/instalaciones.png',
                width: 260,
                height: 40,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 25,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SinTablero(),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/seleccion.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Inicio',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 25,
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/perfil.png',
                          width: 55,
                          height: 35,
                        ),
                        SizedBox(width: 8),
                        Text(''),
                      ],
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        mostrarVentanaEmergente();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/privacidad.png',
                            width: 125,
                            height: 45,
                          ),
                          SizedBox(width: 8),
                          Text(''),
                        ],
                      ),
                    ),
                    value: 2,
                  ),
                  PopupMenuItem(
                     child: GestureDetector(
                      onTap: () {
                        mostrarVentanaEmergente2();
                      },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/uso.png',
                          width: 120,
                          height: 55,
                        ),
                        SizedBox(width: 8),
                        Text(''),
                      ],
                    ),
                     ),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        mostrarVentanaEmergente3();
                      },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/intrucciones.png',
                          width: 100,
                          height: 65,
                        ),
                        SizedBox(width: 8),
                        Text(''),
                      ],
                    ),
                    ),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/cerrar.png',
                          width: 95,
                          height: 55,
                        ),
                        SizedBox(width: 8),
                        Text(''),
                      ],
                    ),
                    value: 5,
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 5) {
                  cerrarSesion();
                }
              },
              child: Container(
                width: 65,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        Positioned(
  top: 125,
  left: 15,
  child: ElevatedButton(
    onPressed: () {
  setState(() {
    botonSeleccionado = 1; 
  });
},
    style: ElevatedButton.styleFrom(
     primary: botonSeleccionado == 1 ? Color(0xFFD9D9D9) : Color(0xFFF94848),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Container(
      width: 300,
      height: 50,
      child: Row(
        children: [
          Image.asset(
            'assets/images/bombas.png',
            width: 50,
            height: 50,
          ),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hidráulica Bombas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),
        Positioned(
  top: 188,
  left: 15,
  child: ElevatedButton(
      onPressed: () {
  setState(() {
    botonSeleccionado = 2; 
  });
},
    style: ElevatedButton.styleFrom(
      primary: botonSeleccionado == 2 ? Color(0xFFFFDD64) : Color(0xFFF94848),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Container(
      width: 300,
      height: 50,
      child: Row(
        children: [
          Image.asset(
            'assets/images/ext.png',
            width: 50,
            height: 50,
          ),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Agentes Extintores',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

          Positioned(
  top: 250,
  left: 15,
  child: ElevatedButton(
     onPressed: () {
  setState(() {
    botonSeleccionado = 3; 
  });
},
    style: ElevatedButton.styleFrom(
      primary: botonSeleccionado == 3 ? Color(0xFFFFA360) : Color(0xFFF94848),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Container(
      width: 300,
      height: 50,
      child: Row(
        children: [
          Image.asset(
            'assets/images/juridico.png',
            width: 50,
            height: 50,
          ),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Jurídico',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

         Positioned(
  top: 313,
  left: 15,
  child: ElevatedButton(
     onPressed: () {
  setState(() {
    botonSeleccionado = 4; 
  });
},
    style: ElevatedButton.styleFrom(
     primary: botonSeleccionado == 4 ? Color(0xFF83E773) : Color(0xFFF94848),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Container(
      width: 300,
      height: 50,
      child: Row(
        children: [
          Image.asset(
            'assets/images/vehiculo.png',
            width: 50,
            height: 50,
          ),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Vehículos y Herramientas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

      Positioned(
  top: 375,
  left: 15,
  child: ElevatedButton(
     onPressed: () {
  setState(() {
    botonSeleccionado = 5; 
  });
},
    style: ElevatedButton.styleFrom(
      primary: botonSeleccionado == 5 ? Color(0xFFFF7878) : Color(0xFFF94848),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Container(
      width: 300,
      height: 50,
      child: Row(
        children: [
          Image.asset(
            'assets/images/fuego.png',
            width: 50,
            height: 50,
          ),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Teoría del Fuego',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

          Positioned(
  top: 435,
  left: 15,
  child: ElevatedButton(
      onPressed: () {
  setState(() {
    botonSeleccionado = 6; 
  });
},
    style: ElevatedButton.styleFrom(
      primary: botonSeleccionado == 6 ? Color(0xFFF8DCFFF) : Color(0xFFF94848),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Container(
      width: 300,
      height: 50,
      child: Row(
        children: [
          Image.asset(
            'assets/images/instalacones.png',
            width: 50,
            height: 50,
          ),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Instalaciones',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

           Positioned(
  top: 495,
  left: 15,
  child: ElevatedButton(
      onPressed: () {
  setState(() {
    botonSeleccionado = 7; 
  });
},
    style: ElevatedButton.styleFrom(
      primary: botonSeleccionado == 7 ? Color(0xFFC99EFF) : Color(0xFFF94848),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Container(
      width: 300,
      height: 50,
      child: Row(
        children: [
          Image.asset(
            'assets/images/mix.png',
            width: 50,
            height: 50,
          ),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Mix',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),
        ],
      ),
    );
  }

  void cerrarSesion() {
    // Restablecer las variables de estado o realizar acciones necesarias para cerrar sesión
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void mostrarVentanaEmergente() {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: SingleChildScrollView(  // Agregado SingleChildScrollView para hacer scroll vertical
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),  // Aumentando el espacio inferior para el título
                child: Text(
                  'Política de Privacidad',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Aquí va tu texto sobre la política de privacidad...',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      );
    },
  );
 }
  void mostrarVentanaEmergente2() {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: SingleChildScrollView(  // Agregado SingleChildScrollView para hacer scroll vertical
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),  // Aumentando el espacio inferior para el título
                child: Text(
                  'Condiciones de Uso',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Aquí va tu texto...',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      );
    },
  );
 }
 void mostrarVentanaEmergente3() {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: SingleChildScrollView(  // Agregado SingleChildScrollView para hacer scroll vertical
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),  // Aumentando el espacio inferior para el título
                child: Text(
                  'Intrucciones',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Aquí va tu texto...',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      );
    },
  );
 }
}
