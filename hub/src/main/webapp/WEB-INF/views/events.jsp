<%@ page import="com.group22.hub.Model.Post" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.group22.hub.Model.User" %>
<%@ page import="com.group22.hub.Repo.PostRepository" %>
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

        .btn-success {
            margin-bottom: 20px;
            margin-left: 47%;
        }


    </style>

    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script><script>

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {

                timeZone: 'GMT',
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left: 'prev,next',
                    center: 'title'
                },
                events: [

                    <c:forEach items="${eventList}" var="event">
                    {

                        title : '${event.title}',
                        start : '${Instant.ofEpochMilli(event.date)}'

                    },
                    </c:forEach>
                ],
                eventClick: function(info) {

                    var eventUrl = "eventdetails?event=" + info.event.title;
                    window.open(eventUrl,eventUrl,
                        "height=200,width=400,status=yes,toolbar=no,menubar=no,location=no");

                }
            });

            calendar.render();

        });

    </script>


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
                    <a class="nav-link" href="/about" style="color:#017b01"><i class="fa-solid fa-magnifying-glass"></i></a>
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
            <a class="navpanel px-5 py-2 link-secondary border-start border-end border-secondary" href="/FundingOpportunities">Funding Opportunity</a>
            <a class="navpanel px-5 py-2 link-secondary border-start border-end border-secondary" href="/events">Events</a>
            <a class="navpanel px-5 py-2 link-secondary border-start border-end border-secondary" href="/user-simulator">Simulation</a>
            <a class="navpanel px-5 py-2 link-secondary border-start border-end border-secondary" href="#">Support</a>
            <a class="navpanel px-5 py-2 link-secondary border-start border-secondary" href="#">Donate</a>
        </nav>
    </div>
</div>


<a href="/eventCreation"><button type="submit" class="btn btn-success">Create Event</button></a>

<div id='calendar'></div>




</body>
</html>