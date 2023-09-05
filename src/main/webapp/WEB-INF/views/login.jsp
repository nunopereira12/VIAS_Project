<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="login-container">
                <form action="/login" method="post" class="card p-3">
                    <img src="css/images/img_proj_1.png" >
                    <c:if test="${error != null}">
                        <div class="alert alert-danger">
                                ${error}
                        </div>
                    </c:if>
                    <div class="mb-3">
                        <label for="username" class="form-label text-start">Username</label>
                        <input type="text" name="username" class="form-control" id="username" placeholder="Your username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label text-start">Password</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Your password" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
                <!-- Add Sign-Up and Password Recovery Buttons Inside the Form -->
                <div class="mt-3 text-center d-flex justify-content-between">
                    <button class="btn btn-secondary" onclick="window.location.href='/signup'">Sign-Up</button>
                    <button class="btn btn-secondary" onclick="window.location.href='/password-recovery'">Password Recovery</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>