import 'package:flutter/material.dart';
import 'sintablero.dart';
import 'user_state.dart';
import 'package:provider/provider.dart';

class Tablero extends StatefulWidget {
  @override
  _TableroState createState() => _TableroState();
}

class _TableroState extends State<Tablero> {
  void cerrarSesion() {
    // Aquí puedes agregar el código necesario para cerrar la sesión del usuario
    // Esto puede incluir borrar tokens de autenticación, reiniciar el estado de la aplicación, etc.
    // Por simplicidad, aquí simplemente navegaré a la pantalla de inicio de sesión
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context); // Acceder al estado global UserState
    bool isAdmin = userState.isAdmin;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 71, 71),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/ciudad.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 200,
            left: 5,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(
              'assets/images/casa.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'opcion5') {
                  cerrarSesion();
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                CustomPopupMenuItem(
                  value: 'opcion1',
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/perfil.png',
                      width: 60,
                      height: 60,
                    ),
                    title: Text(''),
                  ),
                ),
                CustomPopupMenuItem(
                  value: 'opcion2',
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/Privacidad.png',
                      width: 160,
                      height: 60,
                    ),
                    title: Text(''),
                  ),
                ),
                CustomPopupMenuItem(
                  value: 'opcion3',
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/uso.png',
                      width: 125,
                      height: 60,
                    ),
                    title: Text(''),
                  ),
                ),
                CustomPopupMenuItem(
                  value: 'opcion4',
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/intrucciones.png',
                      width: 120,
                      height: 50,
                    ),
                    title: Text(''),
                  ),
                ),
                CustomPopupMenuItem(
                  value: 'opcion5',
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/cerrar.png',
                      width: 120,
                      height: 50,
                    ),
                    title: Text(''),
                  ),
                ),
              ],
              child: Image.asset(
                'assets/images/heroicons-solid_menu-alt-3.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          Positioned(
            top: 230,
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 350,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/Rectangle 14.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Image.asset(
                            'assets/images/tab.png',
                            width: 150,
                            height: 400,
                          ),
                        ),
                        Positioned(
                          right: 55,
                          top: 0,
                          child: Image.asset(
                            'assets/images/Recurso 1 1.png',
                            width: 50,
                            height: 120,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 15,
                          left: 15,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFFCE3333),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Con tablero',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 350,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/Rectangle 15.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Image.asset(
                            'assets/images/tab2.png',
                            width: 150,
                            height: 400,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 15,
                          left: 15,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SinTablero()),
                              );
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFCE3333),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Sin tablero',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 155,
            left: 100,
            child: Image.asset(
              'assets/images/select.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  CustomPopupMenuItem({
    required T value,
    Widget? child,
  }) : super(
          value: value,
          child: child,
        );

  @override
  double get height => 10;
}
