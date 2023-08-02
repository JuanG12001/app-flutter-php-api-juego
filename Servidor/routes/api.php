<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MyController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Aquí es donde puedes registrar las rutas de API para tu aplicación.
| Estas rutas se cargan mediante RouteServiceProvider y se asignan al grupo de middleware "api".
| ¡Disfruta construyendo tu API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [MyController::class, 'registerUser']);
Route::post('/login', [MyController::class, 'loginUser']);
Route::post('/guardar-pregunta', [MyController::class, 'guardarPregunta']);
Route::get('/obtener-preguntas', [MyController::class, 'obtenerPreguntas']);
