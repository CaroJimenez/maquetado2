
<%--
  Created by IntelliJ IDEA.
  User: vvcec
  Date: 28/06/2022
  Time: 12:42 p. m.
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Inicio</title>
    <jsp:include page="templates/importhead.jsp"/>
</head>
<body>
<jsp:include page="templates/menu.jsp"/>
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
                <div class="row justify-content-end">
                    <div class="col-10">
                        Mensajes
                        <div class="alert alert-success" role="alert">
                            A simple success alert—check it out!
                        </div>
                        <c:if test="${param['result-save']!=null}">
                        <div class="alert alert-success" role="alert">
                            Persona Registrada Correctamente
                        </div>
                        </c:if>
                        <c:if test="${param['result-save']=='error'}">
                        <div class="alert alert-success" role="alert">
                            Registro no insertado correctamente
                        </div>
                        </c:if>
                    </div>
                    <div class="col-2 mb-2 mt-2">
                        <a href="create-person" class="btn btn-primary">Registrar persona</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-10">
                <table class="table table-hover table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Edad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="person">
                            <tr>
                                <td><c:out value="${person.id}"/></td>
                                <td><c:out value="${person.name}"/></td>
                                <td><c:out value="${person.age}"/></td>
                                <td>
                                    <a href="get-person?id=${person.id}" class="btn btn-info">
                                        <i class="bi bi-search">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                            </svg>
                                        </i>
                                        Consultar
                                    </a>
                                    <form action="delete-person" method="post">
                                        <input type="hidden" name="id" value="${person.id}"/>
                                        <button type="submit" class="btn btn-danger">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <jsp:include page="templates/importscrips.jsp"/>
</body>
</html>