console.clear();
console.log("Estructuras condicionales");
//Condicional simple
if (num>0){
    //Indentacion
        alert("El numero es positivo.");
}

//Condicional doble
if (num>0){
    //Indentacion
        alert("El numero es positivo.");
}
else{
    alert("El numero es negativo o cero.");
}

//Condicional anidado
if (num>0){
    //Indentacion
        alert("El numero es +.")
}
    else
        if (num < 0)
        alert("El numero es -.")
        else   
            alert("El num es cero.")
    
//else if : elif (NO EXISTE EN JS)
if (num>0){
    //Indentacion
        alert("El numero es +.")
}
else if (num < 0)
        alert("El numero es -.")
else   
        alert("El num es cero.")

//Switch
var menu = parseInt(prompt("INgrese una opcion"));
switch(menu){
    case 1: 
    console.log("Opcion 1: Alta de usuario");
    break;
    case 2:
    case 3: 
    console.log("Opcion 2: Baja de usuario");
    break;
    default:
        console.log("Ha seleccionado una opcion no valida");
}

//Operador ternario
var num = 2;
console.log(num>0 ? "Positivo" : "Negativo o cero")