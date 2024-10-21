<%@ page import="com.group22.hub.Model.Post" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.group22.hub.Model.User" %>
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
                    <a class="nav-link" href="/about" style="color:#017b01"><i class="fa-solid fa-magnifying-glass"></i></a>
                </button> </form>
        </form>

    </div>
</nav>

<section style="background-color: #eee;">
    <div class="container py-5">
        <div class="row bg-dark mx-auto rounded py- my-5">
            <h2 class="fw-bolder text-center text-light py-2">${user.getUserName()}'s Profile</h2>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <img src="/images/${user.getProfile_picture()}" alt="avatar"/>
                        <!-- Displays the username that the user is using -->
                        <h5 class="my-3">${user.getUserName()}</h5>
                        <p class="text-muted mb-4">${user.getBio()}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body mt-4">
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Username</p>
                            </div>
                            <div class="col-sm-9">
                                <!-- Displays the fullname to the user -->
                                <p class="text-muted my-2">${user.getUserName()}</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Full Name</p>
                            </div>
                            <div class="col-sm-9">
                                <!-- Displays the fullname to the user -->
                                <p class="text-muted my-2">${user.getFirstName()} ${user.getLastName()}</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Email</p>
                            </div>
                            <div class="col-sm-9">
                                <!-- displays the email to the user -->
                                <p class="text-muted my-2-0">${user.getEmail()}</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Bio</p>
                            </div>
                            <div class="col-sm-9">
                                <!-- Displays the fullname to the user -->
                                <p class="text-muted my-2-0">${user.getBio()}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Creates card for displaying posts and comments -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-4 mb-md-0">
                            <div class="card-body">
                                <p class="mb-4"><span class="text-primary font-italic me-1">Recent Posts</span> // Community Posts</p>

                                <!-- Gets all posts from specific user -->
                                <%
                                    User user = (User)request.getAttribute("user");
                                    List<Post> reversedPosts = user.getPosts();
                                    Collections.reverse(reversedPosts);
                                %>

                                <!-- Loops through all posts belonging to that user -->
                                <c:forEach var="i" items="<%=reversedPosts%>">
                                    <div class = "card mb-4 mb-md-2" >
                                        <div class="card-body">
                                            <h4 class="card-title mb-2"><c:out value="${i.getTitle()}"/></h4>
                                            <p class ="card-text"><c:out value="${i.getContent()}"/></p>
                                        </div>

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
                                                        <form:form action="/submitCommentProfile?postID=${i.getId()}" modelAttribute="comment" >
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
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>

</body>

</html>