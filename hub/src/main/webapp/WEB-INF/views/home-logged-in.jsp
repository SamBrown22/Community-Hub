<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group22.hub.Repo.UserRepository" %>
<%@ page import="com.group22.hub.Model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Optional" %>
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

    <!-- Container for other Navigation panels(About, Community Hub, Events ....) -->
    <div class="container">
        <div class="scroller py-1 my-2">

            <!-- Places content center -->
            <nav class="nav justify-content-center">
                <a class="navpanel px-5 py-2 link-secondary border-end border-secondary" href="/user-about">About</a>
                <a class="navpanel px-5 py-2 link-secondary border-start border-end border-secondary" href="/communityHub">Community Hub</a>
                <a class="navpanel px-5 py-2 link-secondary border-start border-end border-secondary" href="FundingOpportunities">Funding Opportunities</a>
                <a class="navpanel px-5 py-2 link-secondary border-start border-end border-secondary" href="/events">Events</a>
                <a class="navpanel px-5 py-2 link-secondary border-start border-end border-secondary" href="/user-simulator">Simulation</a>
                <a class="navpanel px-5 py-2 link-secondary border-start border-end border-secondary" href="#">Support</a>
                <a class="navpanel px-5 py-2 link-secondary border-start border-secondary" href="#">Donate</a>
            </nav>
        </div>
    </div>

    <!-- Carousel Slides -->
    <div id="myCarousel" class="carousel slide border border-dark border-5 mt-2 mx-4 rounded" data-bs-ride="carousel">

        <!-- Carousel indicators at the bottom of the slides -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2"></button>
        </div>

        <div class="carousel-inner">

            <!-- First slide -->
            <div class="carousel-item active">
                <img src = "https://images.unsplash.com/photo-1617042375876-a13e36732a04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" height="150%" width="100%" style="filter:brightness(50%)"/>

                <!-- Container for contents inside the slide --->
                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1>Reversible Computation</h1>
                        <p>Curious to find out what Reversible Computation about ? </p>
                        <p><a class="btn btn-lg btn-success" href="/user-about">Find Out More &raquo;</a></p>
                    </div>
                </div>
            </div>

            <!-- Second slide -->
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1475483768296-6163e08872a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" height="180%" width="100%" style="transform:translateY(-20%);filter:brightness(15%)"/>

                <!-- Container for contents inside the slide --->
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Community Hub</h1>
                        <p>A perfect place to find others interested in reversible computation as well as posts which you may find interesting.</p>
                        <p><a class="btn btn-lg btn-success" href="/communityHub">Search &raquo;</a></p>
                    </div>
                </div>
            </div>

            <!-- Third slide -->
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1664206809006-8048d8f4cace?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80" height="150%" width="100%" style="transform:translateY(-20%); transform:scale(1,2);filter:brightness(30%)"/>

                <!-- Container for contents inside the slide --->
                <div class="container">
                    <div class="carousel-caption text-start">
                        <h1>Simulator</h1>
                        <p>Check our example code which visually shows how reversible computing works!</p>
                        <p><a class="btn btn-lg btn-success" href="/user-simulator">Simulate &raquo;</a></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Button to go to previous slide -->
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            <span class="visually-hidden">Previous</span>
        </button>

        <!-- Button to next slide -->
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
            <span class="visually-hidden">Next</span>
        </button>

    </div>

    <!-- Div Class for everything after Carousel -->
    <div class="container marketing">

        <!-- Row for text -->
        <div class="row bg-dark mx-auto rounded">
            <h2 class="fw-bolder text-center text-light py-2">Other Community Members</h2>
        </div>

        <%
            UserRepository user_repo = (UserRepository) request.getAttribute("user_repo");
            List<User> users = (List<User>) user_repo.findAll();
            List<Optional<User>> user_display = new ArrayList<>();

            if (!users.isEmpty()) {
                List<Integer> random_indexes = new ArrayList<>();
                for(int i =0; i<3 ; i++) {
                    Random rand = new Random();
                    int randomIndex = rand.nextInt(users.size());
                    random_indexes.add(randomIndex);
                }
                Optional<User> user1 = user_repo.findById(random_indexes.get(0)+1);
                Optional<User> user2 = user_repo.findById(random_indexes.get(1)+1);
                Optional<User> user3 = user_repo.findById(random_indexes.get(2)+1);

                user_display.add(user1);
                user_display.add(user2);
                user_display.add(user3);

            }
        %>

        <!--  Row for Community members -->
        <%
            if (user_display != null && !user_display.isEmpty()) {
        %>
        <div class="row">
            <c:forEach var="i" items="<%=user_display%>">
                <!-- Column for first displayed member -->
                <div class="col-lg-4">
                    <img src="/images/${i.get().getProfile_picture()}" alt="avatar" width="150px" height="150px"/>
                    <h2 class="fw-normal"><c:out value="${i.get().getUserName()}"/></h2>
                    <p><c:out value="${i.get().getBio()}"/></p>
                    <p><a class="btn btn-success" href="/search/viewprofile?username=${i.get().getUserName()}">View Profile &raquo;</a></p>
                </div>
            </c:forEach>
        </div>
        <%
            }
        %>
    </div>
</body>

</html>