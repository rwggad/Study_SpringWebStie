<%--
  Created by IntelliJ IDEA.
  User: rwgga
  Date: 2018-12-18
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <a class="navbar-brand" href="${cp}/PetClinic/HomeForm">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav nav-pills mr-auto">
            <a class="nav-item nav-link active" href="${cp}/PetClinic/FindForm">FIND OWNERS</a>
            <a class="nav-item nav-link" href="#">VETERINARIANS</a>
            <a class="nav-item nav-link" href="#">ERROR</a>
        </ul>
    </div>
</nav>
<br>
<div class="container">
    <div>
        <p>
        <h4>Find Owners</h4>
        </p>
        <div>
            <form:form action="${cp}/PetClinic/Find" method="post" commandName="owner">
                <p>
                    <form:input path="lastName" cssStyle="width: 100%; margin-left: 150px; padding-left: 10px"
                                placeholder="last Name"/>
                </p>
                <p style="margin-left: 150px">
                    <input class="btn btn-dark" type="submit" value="Find Owner">
                </p>
            </form:form>
        </div>
        <button class="btn btn-dark" value="Add Owner" onclick="location.href='${cp}/PetClinic/NewOwnerForm'">Add Owner</button>
    </div>
</div>
</body>
</html>
