<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Back</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/styles.css">
</head>

<body>
    <div class="welcome-page">
        <div class="welcome-container" >
            <%--<h1 class="welcome-heading" >Welcome Back, ${name}!</h1>--%>
            <img class = "welcome-image" src="/images/logo_bluenobg.png" alt="Your Image" style="width: 300px;" onclick="redirectToHomePage()">
            <div class="animation" onclick="redirectToHomePage()"></div>
        </div>
    </div>

<script src="/js/welcome.js"></script>

</body>
</html>