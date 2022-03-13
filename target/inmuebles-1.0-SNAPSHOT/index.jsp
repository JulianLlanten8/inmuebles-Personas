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
        <h1 class="text-center display-3" v-text="title">

        </h1>
    </div>
    <br/>

    <div class="btn-group">
        <a href="hello-servlet" class="btn btn-primary ">Hello Servlet</a>
        <a href="" class="btn btn-primary" aria-current="page">Nuevo registro</a>
    </div>

    <section class="container table-responsive mt-5">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Correo</th>
                <th scope="col">Direccion</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Cell</td>
                <td>Cell</td>
                <td>Cell</td>
                <td>Cell</td>
                <td>Acciones</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Cell</td>
                <td>Cell</td>
                <td>Cell</td>
                <td>Cell</td>
            </tr>
            </tbody>
        </table>
    </section>
</main>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</body>
</html>
<script>
    var app = new Vue({
        el: '#app', //id del div o elemento del DOM
        data: {
            title: 'Inmuebles'
        },
    })
</script>