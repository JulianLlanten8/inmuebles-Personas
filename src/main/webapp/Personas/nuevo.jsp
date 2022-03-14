<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nueva Persona</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
</head>
<body>
<main id="app">
    <h2 class="text-center display-3">Nuevo registro de persona</h2>
    <br/>
    <section class="container">
        <form autocomplete="off" @submit="enviarFormulario">
            <div class="row mb-3">
                <label for="inputNombre" class="col-sm-2 col-form-label">Nombre</label>
                <div class="col-10">
                    <input type="text" class="form-control" id="inputNombre" v-model="persona.nombre" autofocus>
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputApellido" class="col-sm-2 col-form-label">Apellido</label>
                <div class="col-10">
                    <input type="text" class="form-control" id="inputApellido" v-model="persona.apellido">
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputEmail3" class="col-sm-2 col-form-label">Correo</label>
                <div class="col-10">
                    <input type="email" class="form-control" id="inputEmail3" v-model="persona.correo">
                </div>
            </div>
            <%--TODO: realiazar el select--%>
            <div class="mt-2">
                <button type="submit" class="btn btn-block btn-primary">Enviar Formulario</button>
            </div>
        </form>
    </section>

    <div class="alert alert-info" role="alert" v-if="alerta">
        El usuario se ha creado satisfactoriamente
    </div>
</main>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</body>
</html>
<script>
    const app = new Vue({
        el: '#app', //id del div o elemento del DOM
        data: {
            persona: {
                id: 0,
                nombre: "",
                apellido: "",
                correo: "",
                direccion: 0,
            },
            alerta: false,
        },
        created: function () {
        },
        methods: {
            enviarFormulario() {
                const urlPersonas = "PersonasController?action=insertar";
                axios.post(urlPersonas, this.persona).then(response => {
                    if (response) this.alerta = true;
                }).catch(e => {
                    alert(e);
                });
                setTimeout(this.alerta = false, 3000);
            },
        }
    });
</script>
