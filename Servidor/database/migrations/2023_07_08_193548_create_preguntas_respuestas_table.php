<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePreguntasRespuestasTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('preguntas', function (Blueprint $table) {
            $table->id();
            $table->string('pregunta');
            $table->string('respuesta1');
            $table->string('respuesta2');
            $table->string('respuesta3');
            $table->string('respuesta4');
            $table->unsignedBigInteger('respuesta_correcta')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::dropIfExists('preguntas');
    }
}
