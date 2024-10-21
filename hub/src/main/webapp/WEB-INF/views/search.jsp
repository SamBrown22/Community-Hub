<%@ page import="com.group22.hub.Model.Post" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en" class="no-js">

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
        .marketing .col-lg-4 {
            margin-bottom:2rem;
            margin-top:2rem;
            text-align: center;
        }

        .carousel {
            margin-bottom:3rem;
        }

        .carousel-caption {
            bottom:5rem;
        }

        .carousel-item {
            height:40rem;
        }

        .navpanel:hover {
            background-color: rgba(211, 211, 211, 0.5);
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


        <!-- Search Bar -->
        <form role="search" >
            <!-- this links the search bar to the profile search -->
            <form action="/search"  method="GET"> <input type="text" name="query" formaction="/search" placeholder="Search...">
                <button type="submit" formaction="/search">
                    <!-- Search icon -->
                    <a class="nav-link" href="/search" style="color:#017b01"><i class="fa-solid fa-magnifying-glass"></i></a>
                </button> </form>
        </form>

    </div>
</nav>

<%
    // Gets all results for use in the JSP
    List<Post> results = (List<Post>) request.getAttribute("results");

%>
<!-- use of cards  -->
<div class="row">
    <div class="col-md-12">
        <div class="card mb-5">
            <div class="card-body">

                <!-- Loops through all users and presents links to the associated profile -->
                <c:forEach var="i" items="<%=results%>">
                <div class = "card mb-4" >
                                <span class="fs-6 card-header">
                                    <img src="/images/${i.getProfile_picture()}" alt="avatar" width="50px" height="50px"/>
                                    @<c:out value="${i.getUserName()}"/>
                                    <!-- this will send all data required for controller -->
                                    <form role="search"  >
                                        <form action="/search/viewprofile" method="GET">
                                            <button type="submit" formaction="/search/viewprofile">
                                            <a class="nav-link" href="/search/viewprofile?username=${i.getUserName()}" style="color:#017b01">
                                                Visit this users profile
                                            </a>
                                            </button>
                                        </form>
                                    </form>
                                </span>
                </div>
                </c:forEach>

            </div>
        </div>
    </div>
</div>



</body>
</html>
