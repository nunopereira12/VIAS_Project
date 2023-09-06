<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<%@include file="header.jsp"%>


<head>
    <title>VIAS | Admin Dashboard</title>
    <link rel="stylesheet" href="/css/adminpage.css">
</head>

<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">VIAS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Analytics
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Tickets Sold</a></li>
                        <li><a class="dropdown-item" href="#">Trips Started</a></li>
                        <li><a class="dropdown-item" href="#">Logged In Users</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        User Management
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Ban User</a></li>
                        <li><a class="dropdown-item" href="#">Delete User</a></li>
                        <li><a class="dropdown-item" href="#">Modify User Data</a></li>
                        <li><a class="dropdown-item" href="#">Ban List</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Vias League
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Leaderboards</a></li>
                        <li><a class="dropdown-item" href="#">Active Profiles</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

</div>
</body>
</html>