<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta charset="utf-8">
        <title>Demo App - Update Person</title>

        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://getbootstrap.com/dist/css/bootstrap-responsive.min.css" rel="stylesheet">
    </head>

    <body>
        <div class="container">
            <h1>Update Person</h1>
            <form:form method="post" action="/update/${person.id}" commandName="person" role="form">
                <div class="form-group">
                    <form:label path="firstName">First Name:</form:label>
                    <form:input path="firstName" class="form-control" value="${person.firstName}"/>
                </div>
                <div class="form-group">
                    <form:label path="lastName">Last Name:</form:label>
                    <form:input path="lastName" class="form-control" value="${person.lastName}"/>
                </div>
                <div class="form-group">
                    <form:label path="age">Age</form:label>
                    <form:input path="age" class="form-control" value="${person.age}"/>
                </div>
                
                <button type="submit" class="btn btn-default">Update Person</button>
            </form:form>
        </div>
    </body>
</html>