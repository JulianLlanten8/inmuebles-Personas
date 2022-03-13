<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Imueble</title>
</head>
<body>
<h2>Nuevo registro</h2>
<section class="container">
    <form autocomplete="off">
        <div class="row mb-3">
            <label for="inputNombre" class="col-sm-2 col-form-label" autofocus >Nombre</label>
            <div class="col-10">
                <input type="email" class="form-control" id="inputNombre">
            </div>
        </div>
        <div class="row mb-3">
            <label for="inputApellido" class="col-sm-2 col-form-label">Apellido</label>
            <div class="col-10">
                <input type="password" class="form-control" id="inputApellido">
            </div>
        </div>
        <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
            <div class="col-10">
                <input type="email" class="form-control" id="inputEmail3">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Sign in</button>
    </form>
</section>
</body>
</html>
