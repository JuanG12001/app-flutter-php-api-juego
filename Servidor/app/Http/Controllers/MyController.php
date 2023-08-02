<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Pregunta;

class MyController extends BaseController
{
    public function registerUser(Request $request)
    {
        $fullName = $request->input('fullName');
        $username = $request->input('username');
        $email = $request->input('email');
        $phone = $request->input('phone');
        $password = $request->input('password');
        $confirmPassword = $request->input('confirmPassword');
        
        if (!$request->filled(['fullName', 'username', 'email', 'phone', 'password', 'confirmPassword'])) {
            return response()->json(['error' => 'Por favor, complete todos los campos'], 400);
        }
    
        if ($password != $confirmPassword) {
            return response()->json(['error' => 'Las contraseñas no coinciden'], 400);
        }
    
        $user = new User();
        $user->name = $fullName;
        $user->username = $username;
        $user->email = $email;
        $user->phone = $phone;
        $user->password = bcrypt($password);
        $user->session_token = null;
    
        // Verificar si el usuario es administrador
        if ($username === '$$%admin%$$$' || $email === 'proyect15@gmail.com') {
            $user->role = 'admin';
            $user->setTable('admins');
        } else {
            $user->role = 'normal';
            $user->setTable('users');
        }
    
        $user->save();
    
        return response()->json(['message' => 'Usuario registrado correctamente'], 200);
    }

    
    public function loginUser(Request $request)
    {
        $credentials = $request->only('email', 'password');
    
        // Intentar autenticar como usuario normal
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
    
            if ($user->session_token !== null) {
                $user->session_token = null;
                $user->save();
            }
    
            $sessionToken = bin2hex(random_bytes(32));
    
            $user->session_token = $sessionToken;
            $user->save();
    
            // Verificar si el usuario es administrador
            $isAdmin = $user->role === 'admin';
    
            // Devuelve la respuesta con el mensaje, el token de sesión y si el usuario es administrador
            return response()->json(['message' => 'Inicio de sesión exitoso', 'session_token' => $sessionToken, 'isAdmin' => $isAdmin], 200);
        } else {
            // Intentar autenticar como administrador
            $adminCredentials = array_merge($credentials, ['role' => 'admin']);
    
            if (Auth::guard('admin')->attempt($adminCredentials)) {
                $admin = Auth::guard('admin')->user();
    
                if ($admin->session_token !== null) {
                    $admin->session_token = null;
                    $admin->save();
                }
    
                $sessionToken = bin2hex(random_bytes(32));
    
                $admin->session_token = $sessionToken;
                $admin->save();
    
                // Devuelve la respuesta con el mensaje, el token de sesión y establece isAdmin en true para los administradores
                return response()->json(['message' => 'Inicio de sesión exitoso', 'session_token' => $sessionToken, 'isAdmin' => true], 200);
            }
    
            return response()->json(['error' => 'Credenciales inválidas'], 401);
        }
    }

    public function guardarPregunta(Request $request)
    {
        $pregunta = $request->input('pregunta');
        $respuesta1 = $request->input('respuesta1');
        $respuesta2 = $request->input('respuesta2');
        $respuesta3 = $request->input('respuesta3');
        $respuesta4 = $request->input('respuesta4');
        $respuestaCorrecta = $request->input('respuestaCorrecta');
    
        // Aquí puedes escribir la lógica para guardar los datos en la base de datos
    
        // Por ejemplo, puedes crear un modelo Eloquent para guardar la pregunta y respuestas:
        $nuevaPregunta = new Pregunta();
        $nuevaPregunta->pregunta = $pregunta;
        $nuevaPregunta->respuesta1 = $respuesta1;
        $nuevaPregunta->respuesta2 = $respuesta2;
        $nuevaPregunta->respuesta3 = $respuesta3;
        $nuevaPregunta->respuesta4 = $respuesta4;
        $nuevaPregunta->respuesta_correcta = $respuestaCorrecta;
        $nuevaPregunta->save();
    
        // Puedes agregar más lógica según tus necesidades, como validar los datos antes de guardarlos
    
        return response()->json(['message' => 'Pregunta guardada con éxito'], 200);
    }
    
    public function obtenerPreguntas()
{
    $preguntas = Pregunta::all();

    return response()->json($preguntas)->header('Access-Control-Allow-Origin', '*');
}
}