import 'package:flutter/material.dart';
import 'tablero.dart';
import 'juego_uno.dart';
import 'user_state.dart';
import 'package:provider/provider.dart';

class SinTablero extends StatefulWidget {
  @override
  _SinTableroState createState() => _SinTableroState();
}

class _SinTableroState extends State<SinTablero> {
  bool mostrarDesplegable = false;
  double desplazamiento = 0.0;

  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context); // Acceder al estado global UserState
    bool isAdmin = userState.isAdmin;
    return Scaffold(
      backgroundColor: Color(0xFFCE3333),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tablero()),
                        );
                      },
                      child: Image.asset(
                        'assets/images/seleccion.png',
                        width: 45,
                        height: 45,
                      ),
                    ),
                    Text(
                      'Selección',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        mostrarDesplegable = !mostrarDesplegable;
                        if (mostrarDesplegable) {
                          desplazamiento = MediaQuery.of(context).size.height / 2;
                        } else {
                          desplazamiento = 0.0;
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      transform: Matrix4.translationValues(0.0, desplazamiento, 0.0),
                      child: Image.asset(
                        'assets/images/Rectangle 19.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Juego_Uno()),
                );
              },
              child: Image.asset(
                'assets/images/play.png',
                width: 380,
                height: 60,
              ),
            ),
          ),
          Positioned(
            top: 324,
            left: 0,
            child: Image.asset(
              'assets/images/h2.png',
              width: 123,
              height: 600,
            ),
          ),
          Positioned(
            top: 324,
            left: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  mostrarDesplegable = !mostrarDesplegable;
                  if (mostrarDesplegable) {
                    desplazamiento = MediaQuery.of(context).size.height / 2;
                  } else {
                    desplazamiento = 0.0;
                  }
                });
              },
              child: Image.asset(
                'assets/images/H.png',
                width: 123,
                height: 600,
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
              // Puedes agregar más contenido si es necesario, como botones o iconos.
              // Aquí solo se muestra un ejemplo básico con texto.
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
              // Puedes agregar más contenido si es necesario, como botones o iconos.
              // Aquí solo se muestra un ejemplo básico con texto.
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
              // Puedes agregar más contenido si es necesario, como botones o iconos.
              // Aquí solo se muestra un ejemplo básico con texto.
            ],
          ),
        ),
      );
    },
  );
 }
}
