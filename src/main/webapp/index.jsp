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
    <h1 class="text-center">{{title}}
    </h1>
    <br/>
    <a href="hello-servlet">Hello Servlet</a>
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