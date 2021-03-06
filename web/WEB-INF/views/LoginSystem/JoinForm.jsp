<%--
  Created by IntelliJ IDEA.
  User: rwgga
  Date: 2018-12-12
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

<tbody>
<div class="jumbotron">
    <h1>Join</h1>
    <p class="font-weight-light">SeverTime : ${serverTime}</p>
    <br>
</div>

<div class="container">
    <form:form action="${cp}/LoginSystem/Join" method="post" commandName="member">
        <div><form:input class="btn btn-outline-secondary" path="memId" placeholder="id"/></div> <br>
        <div><form:password class="btn btn-outline-secondary" path="memPw" placeholder="password"/></div> <br>
        <div><form:input class="btn btn-outline-secondary" path="memMail" placeholder="email"/></div> <br>
        <hr/>
        <div style="float:left;">
            <input class="btn btn-primary" type="submit" value="JOIN">
            <a class="btn btn-primary" href="${cp}/">BACK</a>
        </div>
    </form:form>
</div>
</tbody>
</html>
