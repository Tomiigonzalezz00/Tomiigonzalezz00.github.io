console.clear();

//operadores de asignacion
cont=0;
cont+=1;
cont-=1;

num=1;
console.log(num);
num*=2; //num = num*2; 
console.log(num);
num*=2;
console.log(num);
num*=2;
console.log(num);
num*=2;

//operadores relacionales
var A = "5"; //Compara aunque sea string 
B= 2;
C= 2.00;
console.log(A == B); //False
console.log(C === B); //true El triple igual compara valor y tambien tipo 
console.log(A != C); //True 
console.log(B >= C); //True 

//OPeradores Logicos
// AND: && 
// OR: || 
// NOT: !
console.clear();
console.log(A>=5-2**2 && B==0); //true && flase = false
console.log(true && false && true);
console.log(true || false);

//Operadores incrementales
//Operadores ternarios

//Operadores de cadena
texto1 = "Tomas";
texto2 = "Gonzalez";
texto3 = texto1 + " " + texto2;
console.log(texto3); // Tomas Gonzalez

texto ="";
textoVar ="Tomas";
texto += textoVar;
console.log(texto);