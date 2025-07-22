<?php

// EJERCICIO 1: Función que reciba una cadena de texto, la divida por espacios y devuelva cada palabra invertida, respetando el orden de las palabras. 

echo "// EJERCICIO 1".'<br>';

function invertir_cadena ($cadena){
    $palabras = explode(" ", $cadena); //Separa la cadena por palabras
    $palabras_invertidas = array_map(function($palabra) {
        return strrev($palabra); //Invierte las palabras
    }, $palabras);
    return implode(" ", $palabras_invertidas); //Junta las palabras en una cadena y las separa con un espacio
}

echo invertir_cadena('Hola soy una cadena').'<br>';
echo invertir_cadena('Programando ando').'<br>';
echo invertir_cadena('Concatenacion').'<br>';

// EJERCICIO 2: Función que reciba un arreglo de números y retorne un nuevo arreglo conteniendo únicamente los números pares únicos (sin repetidos). 

echo "// EJERCICIO 2".'<br>';

function numeros_pares ($numeros){
    $numeros_pares = []; //Aquí se iránn guardando lo números pares que vayan saliendo

    for ($i = 0; $i < count($numeros); $i++) { //Recorre el arreglo desde la posición 0 hasta el número de posiciones que tiene el arreglo
        $numero = $numeros[$i]; //Guarda el número que va recorriendo en cada posición
        if ($numero % 2 === 0 && !in_array($numero, $numeros_pares)) { //Verifica si el número es par y si existe en el arreglo
            $numeros_pares[] = $numero; //Agrega el número al arreglo de salida
        }
    }

    return $numeros_pares; //Regresa el arreglo con los números pares sin repetir
}

$arreglo1 = [2,7,9,12,33,15,22,12,4]; //Arreglo de entrada
print_r(numeros_pares($arreglo1)); //Arreglo de salida
echo '<br>';

$arreglo2 = [1,2,3,4,5,6,7,2,4,6,8,6]; //Arreglo de entrada
print_r(numeros_pares($arreglo2)); //Arreglo de salida
echo'<br>';

// EJERCICIO 3: Función que reciba dos enteros inicio y fin, y devuelva una lista de pares de números primos gemelos dentro del rango. 

echo "// EJERCICIO 3".'<br>';

function numeros_primos($numero) { //Función para poder saber si un número es primo
    if ($numero < 2) return false; //Los números menores a 2 no son primos

    for ($i = 2; $i < $numero; $i++) {
        if ($numero % $i == 0) { //Saca el residuo de la división de los números y si sale 0, no es primo, entonces regresa false
            return false;
        }
    }

    return true; //Si el número no fue divisible, entonces es primo y regresa true
}

function numeros_primos_gemelos($inicio, $fin){ //Función para saber que números primos tienen números gemelos

    $numeros_primos_gemelos = []; //Guardará los números pares primos gemelos

    for ($i = $inicio; $i < $fin - 2; $i++) { //Recorre los números del rango, desde el inicio hasta el fin
        if (numeros_primos($i) && numeros_primos($i + 2)) { //Verifica cada número para saber si es primo y si tiene número gemelo
            $numeros_primos_gemelos[] = "($i, " . ($i + 2) . ")"; //Va guardando los números pares primos gemelos
        }
    }

    if (count($numeros_primos_gemelos) == 0) { //Si la matriz está vacía, regresa 0
        return 0;
    }

    return $numeros_primos_gemelos; //Regresa el resultado de los números pares primos gemelos
}

print_r(numeros_primos_gemelos(0, 10)); //Devolver números pares primos gemelos de acuerdo al rango de los números de entrada
echo'<br>';

print_r(numeros_primos_gemelos(100, 150)); //Devolver números pares primos gemelos de acuerdo al rango de los números de entrada
echo'<br>';

print_r(numeros_primos_gemelos(700, 800)); //Devolver números pares primos gemelos de acuerdo al rango de los números de entrada
echo'<br>';

// EJERCICIO 4: Función que reciba un arreglo de enteros y un número objetivo, y determine si existe alguna combinación de elementos (sin repetir valores) cuya suma sea igual al número objetivo. 

echo "// EJERCICIO 4".'<br>';

function suma($numeros, $resultado_suma){ // Función que recibe un arreglo de números y un número objetivo y devolverá true o false, según sea el caso

    for($i=0; $i<count($numeros); $i++){ // Recorre el arreglo de numeros desde la posición 0 hasta la posición final del arreglo
        for($j=$i+1; $j<count($numeros); $j++){ //Recorre el arreglo desde dónde está i + 1 hasta la posición final del arreglo
            if($numeros[$i] + $numeros[$j] == $resultado_suma){ //Sumara el número que está en i con el número que está en j y si el resultado en igual al número objetivo, devuelve true
                return true;
            }            
        }
    }

    return false; //Si la suma no coincide con el número objetivo, devuelve false
}

var_dump(suma([2,5,8,44,1,7], 9)); //Imprime el resultado boleano true o false de la funcion suma y da el arreglo y número objetivo.
echo'<br>';

var_dump(suma([55,3,8,11,45,1], 12)); //Imprime el resultado boleano true o false de la funcion suma y da el arreglo y número objetivo.
echo'<br>';

var_dump(suma([4,8,48,44,1], 11)); //Imprime el resultado boleano true o false de la funcion suma y da el arreglo y número objetivo.
echo'<br>';

?>