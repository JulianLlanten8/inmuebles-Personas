<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Inmuebles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
</head>
<body>
<main id="app">
    <div class="jumbotron jumbotron-fluid">
        <h1 class="text-center display-3 text-success" v-text="title">
        </h1>
    </div>
    <br/>

    <div class="btn-group">
        <a href="Personas/nuevo.jsp" class="btn btn-primary" aria-current="page">Nuevo registro</a>
    </div>

    <div class="container mt-5">
        <%--Bucador--%>
        <input type="text" class="form-control" @keyup="searchPersona(buscar)" v-model="buscar"
               placeholder="Bucar por nombre, apellido, correo">
    </div>
    <%--Tabla --%>
    <section class="table-responsive m-2">
        <table class="table table-dark table-hover ">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Correo</th>
                <th scope="col">Direccion</th>
                <th scope="col">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="persona in personas" :key="persona.id">
                <td v-text="persona.id"></td>
                <td v-text="persona.nombre"></td>
                <td v-text="persona.apellido"></td>
                <td v-text="persona.correo"></td>
                <td v-text="persona.direccion"></td>
                <td>
                    <button type="button" class="btn btn-primary">Editar</button>
                    <button type="button" class="btn btn-danger">Eliminar</button>
                </td>
            </tr>
            </tbody>
        </table>
    </section>

    <%--Modal--%>

    <div class="alert alert-info" role="alert" v-if="alerta">
        No se encontraron resultados
    </div>

    <%--MOdal/--%>
</main>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</body>
</html>
<script>
    const app = new Vue({
        el: '#app', //id del div o elemento del DOM
        data: {
            title: 'Inmuebles',
            personas: {},
            personasCopi: {},
            buscar: "",
            alerta: false,
        },
        created: function () {
            this.getPersonas();
        },
        methods: {
            getPersonas() {
                const urlPersonas = "PersonasController";
                axios.get(urlPersonas).then(response => {
                    this.personas = response.data;
                    this.personasCopi = response.data;
                }).catch(e => {
                    alert(e);
                });
            },
            searchPersona(value) {
                const formatName = value.toLowerCase();
                const results = this.personas.filter((persona) => {
                    const personaName = persona.nombre.toLowerCase();
                    const personaApellido = persona.apellido.toLowerCase();
                    const personaCorreo = persona.correo.toLowerCase();

                    if (personaName.includes(formatName) ||
                        personaApellido.includes(formatName) ||
                        personaCorreo.includes(formatName)) {
                        return persona;
                    }
                });
                if (!value || value.length < 0) {
                    this.personas = this.personasCopi
                } else {
                    this.personas = results
                }
            }
        }
    });

</script>
<style>
    body {
        background-color: #242424;
    }
</style>