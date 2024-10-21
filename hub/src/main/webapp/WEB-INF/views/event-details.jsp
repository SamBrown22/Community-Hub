<%@ page import="com.group22.hub.Model.Post" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.group22.hub.Model.Event" %>
<%@ page import="java.time.Instant" %>
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



    </div>
</nav>


<section style="background-color: #eee;" class="pt-4 map">
    <div class="container fill">
        <div class="col-lg-8">
            <div class="card mb-4">
                <div class="card-body mt-4">
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">event</p>
                        </div>
                        <div class="col-sm-9">
                            <!-- Displays the event title -->
                            <p class="text-muted my-2">${event.getTitle()}</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">event date and time</p>
                        </div>
                        <div class="col-sm-9">
                            <!-- Displays the date and time-->
                            <p class="text-muted my-2">${event.getDateTime()}</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">event description</p>
                        </div>
                        <div class="col-sm-9">
                            <!-- displays event description -->
                            <p class="text-muted my-2-0">${event.getDescription()}</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">event location</p>
                        </div>
                        <div class="col-sm-9">
                            <!-- Displays the location -->
                            <p class="text-muted my-2-0">${event.getLocation()}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</section>



</body>
</html>
