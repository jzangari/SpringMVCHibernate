<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta charset="utf-8">
        <title>Demo App</title>

        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://getbootstrap.com/dist/css/bootstrap-responsive.min.css" rel="stylesheet">
    </head>

    <body>
        <div class="container">
            <h1>People</h1>
            <form:form method="post" action="add" commandName="person" role="form">
                <div class="form-group">
                    <form:label path="firstName">First Name:</form:label>
                    <form:input path="firstName" class="form-control" placeholder="First Name"/>
                </div>
                <div class="form-group">
                    <form:label path="lastName">Last Name:</form:label>
                    <form:input path="lastName" class="form-control" placeholder="Last Name"/>
                </div>
                <div class="form-group">
                    <form:label path="age">Age</form:label>
                    <form:input path="age" class="form-control" placeholder="Age"/>
                </div>
                <button type="submit" class="btn btn-default">Add Person</button>
            </form:form>

            <c:if test="${!empty people}">
                <h3>Users</h3>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Age</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${people}" var="person">
                            <tr>
                                <td>${person.lastName}, ${person.firstName}</td>
                                <td>${person.age}</td>
                                <td>
                                    <form:form action="update/${person.id}" method="get"><input type="submit"
                                                                                               class="btn btn-mini"
                                                                                               value="Update" style="float: left;"/>
                                    </form:form>
                                    <form:form action="delete/${person.id}" method="post"><input type="submit"
                                                                                               class="btn btn-danger btn-mini"
                                                                                               value="Delete" style="float: left;"/>
                                    </form:form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </body>
</html>