const {createApp} = Vue;

const miComponente = {
    template: `
    <div v-on:click="cambiarNombre()" v-on:mouseout="reestablecerNombre()">
        <h1>Componente creado por <span id ="nombre">{{nombre}}</span></h1>
    </div>
    `,
    data(){
        return{
            nombre: "Tomas"
        }
    },
    methods: {
        cambiarNombre(){
            this.nombre = "Nahuel"
        },
        reestablecerNombre(){
            this.nombre = "Tomas"
        }

    } 
}


const ejemplo3 = Vue.createApp({ /* Creacion de objeto Vue */
    components:{
        'mi-componente':miComponente
    }
}).mount('#ejemplo3') //Monta el objeto vue con html, se integra con el div que tiene id "app" 