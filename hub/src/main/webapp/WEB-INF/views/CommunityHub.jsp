<%@ page import="com.group22.hub.Model.Post" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="com.group22.hub.Repo.PostRepository" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

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
        <!-- Community Hub label -->
        <div class="row bg-dark mx-auto rounded py- my-5">
            <h2 class="fw-bolder text-center text-light py-2">Community Hub</h2>
        </div>

        <!-- Submission Post -->
        <div class="accordion Post" id="accordionExample">
            <div class="accordion-item">
                <!-- this toggles the content of the accordion class and reveals the title and content inputs -->
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button postCreate" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                        Share something...
                    </button>
                </h2>

                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                    <div class="accordion-body">
                        <form:form action="/submitPost" modelAttribute="postcontent" method="post">
                            <!-- this describes the title input field -->
                            <div class="col-sm-3">
                                <p class="mb-0">Title</p>
                            </div>
                            <div class="form-group">
                                <form:input path="title" type="text" class="form-control" placeholder="Title"/>
                            </div>
                            <!-- this describes the content input field -->
                            <div class="col-sm-3">
                                <p class="mb-0">Content</p>
                            </div>
                            <div class="form-group">
                                <form:textarea path="content" type="text" class="form-control" placeholder="Content"/>
                            </div>
                            <!-- this describes the publication URL input field -->
                            <div class="col-sm-3">
                                <p class="mb-0">Publication URL</p>
                            </div>
                            <div class="form-group">
                                <form:input path="publicationURL" type="text" class="form-control" placeholder="Publication URL"/>
                            </div>
                            <!-- this is the button that publishes the comment and title -->
                            <div class="form-group mt-4">
                                <a href="/submitPost"><button type="submit" class="btn btn-success">Create Post</button></a>
                            </div>
                        </form:form>


                    </div>
                </div>
            </div>
        </div>



        <!-- Creates card for displaying posts and comments -->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-5">
                    <div class="card-body">
                        <p class="mb-4"><span class="text-primary font-italic me-1">Recent Posts</span> // Community Posts</p>

                        <!-- Gets all posts from repo -->
                        <%
                            PostRepository post_repo = (PostRepository) request.getAttribute("post_repo");
                            List<Post> posts = (List<Post>) post_repo.findAll();
                            Collections.reverse(posts);
                        %>

                        <!-- Loops through all posts in database -->
                        <c:forEach var="i" items="<%=posts%>">
                            <div class = "card mb-4" >
                                <span class="fs-6 card-header">
                                    <img src="/images/${i.getUser().getProfile_picture()}" alt="avatar" width="50px" height="50px"/>
                                    @<c:out value="${i.getUser().getUserName()}"/>
                                </span>
                                <div class="card-body">
                                    <h4 class="card-title mb-2"><c:out value="${i.getTitle()}"/></h4>
                                    <p class ="card-text"><c:out value="${i.getContent()}"/></p>

                                    <!-- Check if publication URL exists -->
                                    <c:if test="${not empty i.getPublicationURL()}">
                                        <p class="card-text">Publication Link: <a href="<c:out value="${i.getPublicationURL()}" />"><c:out value="${i.getPublicationURL()}" /></a></p>
                                    </c:if>

                                    <!-- Creates an accordion to drop down comment form and comments -->
                                    <div class="accordion" id="Comment">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingComments">
                                                <button class="accordion-button Comment" type="button" data-bs-toggle="collapse" data-bs-target="#collapseComment<c:out value="${i.getId()}"/>">
                                                    View Comments ...
                                                </button>
                                            </h2>
                                            <div id="collapseComment<c:out value="${i.getId()}"/>" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample2" style="">
                                                <div class="accordion-body">

                                                    <!-- Form for modelling new comment under each post -->
                                                    <form:form action="/submitComment?postID=${i.getId()}" modelAttribute="comment" >
                                                        <div class="form-group">
                                                            <form:textarea path="commentContent" type="text" class="form-control" placeholder="Comment ..."/>
                                                        </div>

                                                        <input type="hidden" path="postID" value="${i.getId()}"/>
                                                        <div class="form-group my-2">
                                                            <a href="/submitComment"><button type="submit" class="btn btn-success mb-4">Post Comment</button></a>
                                                        </div>
                                                        <p class="fs-5 text-muted">Comments</p>
                                                    </form:form>

                                                    <!-- Loop for displaying a posts comments -->
                                                    <c:forEach var="j" items="${i.getComments()}">
                                                        <div class="card mb-2">
                                                            <h6 class="card-header">
                                                                <img src="/images/${j.getUser().getProfile_picture()}" alt="avatar" width="35px" height="35px"/>
                                                                @<c:out value="${j.getUser().getUserName()}"/>
                                                            </h6>
                                                            <div class="card-body">
                                                            <c:out value="${j.getCommentContent()}"/>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

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