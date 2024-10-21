<%@ page import="com.group22.hub.Model.Post" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.group22.hub.Model.User" %>
<%@ page import="com.group22.hub.Repo.PostRepository" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Reversible Computation Community</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap Framework Stylesheet -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>

    <!-- Font Awesome Stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous"/>

    <!-- Website Stylesheet-->
    <link href="css/WebsiteCSS.css" rel="stylesheet"/>

    <!-- Javascript Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <style>
        html, body {
            height: 100%;
        }
        .fill {
            min-height: 100%;
            height: 100%;
        }
        .map {
            width: 100%;
            min-height: 100%;
        }
        .accordion.Post {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding-bottom: 20px;
            width: 100%;
            text-align: left;
            border: none;
            outline: none;
            transition: 0.4s;
        }

        .accordion-button.postCreate {
            color: black;
            font-size: 25px;
        }

        .accordion-button.Comment{
            color: #0d0d0d;
            font-size: 18px;
        }


    </style>
</head>

<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-dark bg-gradient bg-black">
    <div class="container-fluid mx-2">

        <!-- Navigation Bar Title -->
        <a class="navbar-brand" href="/home"><img src="https://i.ibb.co/0VQZcD7/1-1.png" width="50px" height="50px"><rect style="padding:1rem"/>Reversible Computation Community Hub </a>

        <!-- Row for Navigation panels(sign-up, login) -->
        <ul class="nav navbar-nav ms-auto flex-row">
            <li class="nav-item me-4"> <a class="nav-link" href="/profile"><i class="fa-solid fa-user"></i> View Profile </a></li>
            <li class="nav-item me-4"> <a class="nav-link" href="/logout"><i class="fa-solid fa-right-to-bracket"></i> Log-Out</a></li>
        </ul>

        <!-- Search icon -->
        <a class="me-2" style="color:#017b01"><i class="fa-solid fa-magnifying-glass"></i></a>

        <!-- Search Bar -->
        <form role="search">
            <input class="form-control" type="search" placeholder="Search">
        </form>

    </div>
</nav>


<section style="background-color: #eee;" class="pt-4 map">
    <div class="container fill">

        <!-- Submission Post -->
        <div class="accordion Post" id="accordionExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button postCreate" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                        Create a new Event
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                    <div class="accordion-body">
                        <form:form action="/submitEvent" modelAttribute="eventcontent" method="post">


                            <div class="col-sm-3">
                                <p class="mb-0">Title</p>
                            </div>
                            <div class="form-group">
                                <form:input path="title" type="text" class="form-control" placeholder=
                                        "The events title..."/>

                            </div>


                            <div class="col-sm-3">
                                <p class="mb-0">Description</p>
                            </div>
                            <div class="form-group">
                                <form:textarea path="description" type="text" class="form-control" placeholder=
                                        "The events description..."/>
                            </div>


                            <div class="col-sm-3">
                                <p class="mb-0">Location</p>
                            </div>
                            <div class="form-group">
                                <form:input path="location" type="text" class="form-control" placeholder=
                                        "A location as a link or text..."/>
                            </div>


                            <div class="col-sm-3">
                                <p class="mb-0">Date</p>
                            </div>
                            <div class="form-group">
                                <form:input path="stringDate" type="text" class="form-control" placeholder=
                                        "dd/mm/yyyy"/>
                            </div>


                            <div class="col-sm-3">
                                <p class="mb-0">Time</p>
                            </div>
                            <div class="form-group">
                                <form:input path="stringTime" type="text" class="form-control" placeholder=
                                        "hh/mm"/>
                            </div>


                            <div class="form-group mt-4">
                                <a href="/submitEvent"><button type="submit" class="btn btn-success">Create Event</button></a>
                            </div>

                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



</body>
</html>
