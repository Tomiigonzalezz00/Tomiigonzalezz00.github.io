//while
//Ciclo exacto
cont= 0;
while(con<5){
    cont ++; //cont = cont + 1;
    console.log(cont);
}

//Ciclo Condicional 
var num =  parseInt(prompt("INgrese un num:"));
suma =0;
while(num != 0){
    suma += num;
    num = parseInt(prompt("Ingrese un num:"))
}
console.log(suma)
//do-while
var menu;
do {
    menu = parseInt(prompt("Ingrese una opcion:"));
} while(!(menu >= 1 && menu <=5));
console.log(menu);

//for
for (let i=1; i<=5;i++){
    console.log(i);
}
