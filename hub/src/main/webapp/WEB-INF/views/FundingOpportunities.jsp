<%@ page import="com.group22.hub.Repo.FundingOpportunityRepository" %>
<%@ page import="com.group22.hub.Model.FundingOpportunity" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
                        <a class="nav-link" href="/about" style="color:#017b01"><i class="fa-solid fa-magnifying-glass"></i></a>
                    </button> </form>
            </form>
        </div>
    </nav>

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

    <!-- Carousel Slides -->
    <div id="myCarousel" class="carousel slide border border-dark border-5 mt-2 mx-4 rounded" data-bs-ride="carousel">

        <!-- Carousel indicators at the bottom of the slides -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2"></button>
        </div>

    </div>


    <section style="background-color: #eee;" class="pt-4 map">
        <div class="container fill">
            <!-- Funding Opportunities label -->
            <div class="row bg-dark mx-auto rounded py- my-5">
                <h2 class="fw-bolder text-center text-light py-2">Funding Opportunities</h2>
            </div>
        <!-- Create New Funding Opportunity -->
        <div class="accordion Post" id="accordionExample">
            <div class="accordion-item">
                <!-- this toggles the content of the accordion class and reveals the title and content inputs -->
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                        Create Funding Opportunity ...
                    </button>
                </h2>

                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                    <div class="accordion-body">
                        <form:form action="/submitFundingOpportunity" modelAttribute="fundingOpportunity" method="post">
                            <!-- this describes the funding name input field -->
                            <div class="col-sm-3">
                                <p class="mb-0">Funding Name</p>
                            </div>
                            <div class="form-group">
                                <form:input path="fundingName" type="text" class="form-control" placeholder="Funding Name"/>
                                <form:errors path="fundingName"/>
                            </div>
                            <!-- this describes the total fund input field -->
                            <div class="col-sm-3">
                                <p class="mb-0">Total Fund</p>
                            </div>
                            <div class="form-group">
                                <form:input path="totalFund" type="text" class="form-control" placeholder="Total Fund"/>
                                <form:errors path="totalFund"/>
                            </div>
                            <!-- this describes the single award input field -->
                            <div class="col-sm-3">
                                <p class="mb-0">Single Award</p>
                            </div>
                            <div class="form-group">
                                <form:input path="singleAward" type="text" class="form-control" placeholder="Single Award"/>
                                <form:errors path="singleAward"/>
                            </div>
                            <!-- this describes the opening date input field -->
                            <div class="col-sm-3">
                                <p class="mb-0">Opening Date</p>
                            </div>
                            <div class="form-group">
                                <form:input path="openDate" type="text" class="form-control" placeholder="Opening Date"/>
                            </div>
                            <!-- this describes the closing date input field -->
                            <div class="col-sm-3">
                                <p class="mb-0">Closing Date</p>
                            </div>
                            <div class="form-group">
                                <form:input path="closeDate" type="date" class="form-control" placeholder="Closing Date"/>
                                <form:errors path="closeDate"/>
                            </div>
                            <!-- this describes the description input field -->
                            <div class="col-sm-3">
                                <p class="mb-0">Description</p>
                            </div>
                            <div class="form-group">
                                <form:textarea path="description" type="text" class="form-control" placeholder="Funding Description"/>
                                <form:errors path="description"/>
                            </div>
                            <!-- this is the button that ppublishes the comment and title -->
                            <div class="form-group mt-4">
                                <a href="/submitFundingOpportunity"><button type="submit" class="btn btn-success">Create Funding Opportunity</button></a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-5">
                    <div class="card-body">
                        <p class="mb-4"><span class="text-primary font-italic me-1">Most Recent</span> // Funding Opportunities</p>

                        <!-- Gets all posts from repo -->
                            <%
                                FundingOpportunityRepository funding_repo = (FundingOpportunityRepository)
                                        request.getAttribute("funding_repo");
                                List<FundingOpportunity> fundingOpportunities = (List<FundingOpportunity>)
                                        funding_repo.findAll();
                                Collections.reverse(fundingOpportunities);
                            %>

                        <c:forEach var="i" items="<%=fundingOpportunities%>">
                            <div class = "card mb-4">
                                <span class="fs-6 card-header">
                                    <img src="/images/${i.getUser().getProfile_picture()}" alt="avatar" width="50px" height="50px"/>
                                    @<c:out value="${i.getUser().getUserName()}"/>
                                </span>
                                <div class="card-body">
                                    <h4 class="card-title mb-2"><c:out value="${i.getFundingName()}"/></h4>
                                    <p class="card-text">Description: <c:out value="${i.getDescription()}"/></p>
                                    <p class="card-text">Total Fund: £<c:out value="${i.getTotalFund()}"/></p>
                                    <p class="card-text">Single Award: £<c:out value="${i.getSingleAward()}"/></p>
                                    <p class="card-text">Opening Date: <c:out value="${i.getOpenDate()}"/></p>
                                    <p class="card-text">Closing Date: <c:out value="${i.getCloseDate()}"/></p>
                                    <p class="card-text">To apply for this funding opportunity please contact me at
                                        <c:out value="${i.getUser().getEmail()}"/></p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>


</body>
</html>