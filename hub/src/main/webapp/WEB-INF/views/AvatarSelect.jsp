
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        label {
            display: inline-block;
            margin-right: 20px;
            margin-bottom: 20px;
        }

        input[type=submit]{
            width: 100%;
            display: inline-block;
            padding: 12px 12px;

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
<div class = "container my-5 flex-content text-center">
    <div class="container marketing">
        <!-- Row for text -->
        <div class="row bg-dark mx-auto rounded py- my-5">
            <h2 class="fw-bolder text-center text-light py-2">Avatar Selector</h2>
        </div>
    </div>
    <form:form action="/changeAvatar" modelAttribute="user" method="post">
        <div id="images">
            <%
                String[] images = { "001-user-11.png", "002-user-12.png", "003-user-13.png", "004-user.png", "005-user-1.png", "006-user-2.png", "007-man.png",
                "008-user-3.png", "009-user-4.png", "010-user-5.png", "011-user-6.png", "012-user-7.png", "013-user-8.png", "014-user-9.png", "016-user-14.png",
                    "017-user-15.png"};
                for (int i = 0; i < images.length; i++) {
            %>
            <label>
                <form:radiobutton name="image" value="<%= images[i] %>" path="profile_picture"/>
                <img src="<%= request.getContextPath() %>/images/<%= images[i] %>" alt="<%= images[i] %>">
            </label>
            <%
                }
            %>
        </div>
        <input type="submit" class="mt-4 btn btn-success"/>
    </form:form>
</div>

</body>
</html>
