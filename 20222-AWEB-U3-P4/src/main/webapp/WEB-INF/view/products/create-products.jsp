<%--
  Created by IntelliJ IDEA.
  User: xemma
  Date: 29/07/2022
  Time: 08:15 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
    List<BeanPerson> ListPersons = (ArrayList)request.getAttribute("list");
--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lista productos</title>
    <jsp:include page="${pageContext}/templates/importhead.jsp"/>
</head>
<body>
<jsp:include page="../templates/menu.jsp"/>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <span class="navbar-text"> <c:out value="${sessionScope.get('name')}" />
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled">Disabled</a>
                </li>
            </ul>
            <form action="logout" class="d-flex" role="search">
                <button class="btn btn-outline-danger" type="submit">Salir</button>
            </form>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-10">
            <form method="post" action="save-person" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="name-product" class="form-label">Nombre producto: </label>
                    <input type="text" class="form-control" id="name-product" name="name">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">$</span>
                    <label for="price-product" class="form-label">Precio: </label>
                    <input type="text" class="form-control" name="price" id="price-product">
                </div>
                <div class="mb-3">
                    <label for="categori-product" class="form-label">Categoria: </label>
                    <select name="category-product" id="categori-product" class="form-label">
                        <option value="botana">Botana</option>
                        <option value="bebidas">Bebidas</option>
                        <option value="dulces">dulces</option>
                    </select>
                    <div class="mb-3">
                        <label for="photo-product" class="form-label">Foto de productos: </label>
                        <input type="text" class="form-control" id="photo-product" name="name">
                    </div>
                    <button class="btn btn-primary" type="submit">Registrar</button>
                    <button class="btn btn-danger" type="reset">Cancelar</button>
                </div>
            </form>
        </div>
</div>

<jsp:include page="../templates/importscrips.jsp"/>
</body>
</html>