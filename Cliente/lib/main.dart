import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'tablero.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'juego_uno.dart';
import 'user_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/newWindow': (context) => NewWindow(),
        '/tablero': (context) => Tablero(),
        '/juegoUno': (context) => Juego_Uno(),
      },
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context); // Acceder a la instancia global de UserState
    return _HomePageContent(userState: userState);
  }
}

class _HomePageContent extends StatefulWidget {
  final UserState userState;

  const _HomePageContent({required this.userState});

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  bool showPassword = false;
  bool isLoading = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  Future<void> loginUser() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      print('Por favor, complete todos los campos');
      return;
    }

    String url = 'http://127.0.0.1:8000/api/login';

    try {
      var response = await http.post(
        Uri.parse(url),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        print('Inicio de sesión exitoso');

        // Obtén una referencia al estado global UserState desde el widget padre
        bool isAdmin = jsonDecode(response.body)['isAdmin'];

        widget.userState.setIsAdmin(isAdmin); // Establece el valor de isAdmin en el estado global

        Navigator.pushNamed(
          context,
          '/tablero',
        );
      } else {
        print('Error en el inicio de sesión');
        print(response.body);
      }
    } catch (error) {
      print('Error en la solicitud');
      print(error);
    }
  }
  
  Future<void> registerWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      print('Inicio de sesión con Facebook exitoso');
      print('Token de acceso: ${accessToken.token}');

      String url = 'http://127.0.0.1:8000/api/facebook/register';

      try {
        var response = await http.post(
          Uri.parse(url),
          body: {'access_token': accessToken.token},
        );

        if (response.statusCode == 200) {
          print('Registro con Facebook exitoso');
          Navigator.pushNamed(context, '/tablero');
        } else {
          print('Error en el registro con Facebook');
          print(response.body);
        }
      } catch (error) {
        print('Error en la solicitud');
        print(error);
      }
    } else {
      print('Error en el inicio de sesión con Facebook');
      print('Mensaje de error: ${result.message}');
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return Stack(
            children: [
              Container(
                color: Color(0xFFF94848),
              ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/Group 1.png',
                width: 375,
                height: 680,
              ),
            ),
            Positioned(
              top: 320,
              left: 0,
              child: Square(),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/Group.png',
                width: 370,
                height: 300,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/Mask group.png',
                width: 370,
                height: 200,
              ),
            ),
            Positioned(
              top: 85,
              left: 80,
              child: Image.asset(
                'assets/images/Frame.png',
                width: 200,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 85,
              left: 220,
              child: Image.asset(
                'assets/images/Frame-1.png',
                width: 75,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 25,
              right:5,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/newWindow');
                },
                child: Image.asset(
                  'assets/images/fluent_person-add-24-filled.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Positioned(
              top: 500,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  registerWithFacebook();
                },
                child: Image.asset(
                  'assets/images/Group 8.png',
                  width: 280,
                  height: 200,
                ),
              ),
            ),
            Positioned(
              top: 500,
              left: 10,
              child: Image.asset(
                'assets/images/Group 9.png',
                width: 400,
                height: 200,
              ),
            ),
            Positioned(
              left: 16,
              right: 20,
              child: Column(
                children: [
                  SizedBox(height: 347),
                  Text(
                    'Inicio de sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  KeyboardVisibilityProvider(
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color(0xFFFFE5BF)),
                        fillColor: Color(0xFFBF2121),
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      KeyboardVisibilityProvider(
                        child: TextField(
                          controller: passwordController,
                          obscureText: !showPassword,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: Color(0xFFFFE5BF)),
                            fillColor: Color(0xFFBF2121),
                            filled: true,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          showPassword
                              ? 'assets/images/ojo.png'
                              : 'assets/images/ojo.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        loginUser();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFF9433),
                        onPrimary: Color(0xFF5E0E0E),
                        side: BorderSide(color: Color(0xFFBF2121)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xFFFF9433))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'o',
                          style: TextStyle(
                            color: Color(0xFFFF9433),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Color(0xFFFF9433))),
                ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 600,
      color: Color(0xFFCE3333),
    );
  }
}

class NewWindow extends StatefulWidget {
  @override
  _NewWindowState createState() => _NewWindowState();
}

class _NewWindowState extends State<NewWindow> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool showPassword = false;
  bool showConfirmPassword = false;

  Future<void> registerUser() async {
    String fullName = fullNameController.text;
    String username = usernameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Validar los campos antes de enviar la solicitud
    if (fullName.isEmpty ||
        username.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      print('Por favor, complete todos los campos');
      return;
    }

    if (password != confirmPassword) {
      print('Las contraseñas no coinciden');
      return;
    }

    // Verificar si es un administrador basado en los valores ingresados
    bool isAdmin = false;

    if (username == '\$\$%admin%\$\$') { // Comprobar si el nombre de usuario es "$$%admin%$$$"
      isAdmin = true;
    }

    // objeto de datos a enviar a la API
    Map<String, dynamic> data = {
      'fullName': fullName,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
      'isAdmin': isAdmin, // Agregar el rol de administrador al objeto de datos
    };

     try {
    // Convertir el objeto de datos a formato JSON
    String jsonData = json.encode(data);

    // Enviar los datos a la API con Laravel
    final url = Uri.parse('http://127.0.0.1:8000/api/register');
    final response = await http.post(
      url,
      body: jsonData, // Enviar los datos en formato JSON
      headers: {
        'Content-Type': 'application/json', // Establecer la cabecera para indicar que se envía JSON
      },
    );

    // Verificar el código de respuesta de la API
    if (response.statusCode == 200) {
      // Registro exitoso
      print('Usuario registrado correctamente');

      Navigator.pushNamed(context, '/tablero');
    } else {
      // Error en el registro
      print('Error en el registro de usuario');
      // mensaje de error, etc.
    }
  } catch (e) {
    // Error en la solicitud
    print('Error en la solicitud: $e');
    // mostrar un mensaje de error, etc.
  }
}


  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Scaffold(
        backgroundColor: Color(0xFFF94848),
        appBar: AppBar(
          backgroundColor: Color(0xFFF94848),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/images/atras_1.png',
              width: 24,
              height: 100,
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 150,
              child: Image.asset(
                'assets/images/Group.png',
                width: 100,
                height: 200,
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 200,
                color: Color(0xFFCE3333),
              ),
            ),
            Positioned(
              top: 5,
              left: 170,
              child: Image.asset(
                'assets/images/Mask group.png',
                width: 65,
                height: 100,
              ),
            ),
            Positioned(
              top: 75,
              left: 150,
              child: Image.asset(
                'assets/images/Frame.png',
                width: 100,
                height: 100,
              ),
            ),
            Positioned(
              top: 75,
              left: 220,
              child: Image.asset(
                'assets/images/Frame-1.png',
                width: 40,
                height: 100,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/Group 1.png',
                  height: 400,
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 120,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'Registro de Usuario',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 208,
              left: 65,
              child: Container(
                width: 250,
                child: Column(
                  children: [
                    TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre completo',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre de usuario',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Teléfono',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          controller: passwordController,
                          obscureText: !showPassword,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Image.asset(
                            showPassword
                                ? 'assets/images/ojo.png'
                                : 'assets/images/ojo.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Repita su contraseña',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showConfirmPassword = !showConfirmPassword;
                            });
                          },
                          icon: Image.asset(
                            showConfirmPassword
                                ? 'assets/images/ojo.png'
                                : 'assets/images/ojo.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9433),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xFF9B2424)),
                      ),
                      child: ElevatedButton(
                        onPressed: registerUser,
                        child: Text(
                          'Registrar',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF5E0E0E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
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
    );
  }
}