<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

    <!-- Javascript Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <style>
        input[type=text]{
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type=submit]{
            width: 100%;
            display: inline-block;
            padding: 12px 12px;

        }

        .thumbnail{
            position: relative;
        }

        .text-over-img{
            position: absolute;
            top: 30%;
            left: 0;
            width: 100%;
        }

    </style>
</head>

<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-dark bg-gradient bg-black">
    <div class="container-fluid mx-2">

        <!-- Navigation Bar Title -->
        <a class="navbar-brand" href="/"><img src="https://i.ibb.co/0VQZcD7/1-1.png" width="50px" height="50px"><rect style="padding:1rem"/>Reversible Computation Community Hub </a>

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

<!-- Container for content -->
<div class="container my-4">
    <!-- Row for Sign-up page declaration -->
    <div class="row">
        <div class="row bg-dark mx-auto my-2 rounded">
            <h2 class="fw-bolder text-center text-light py-2">Sign-Up</h2>
        </div>
    </div>
    <!-- Row for contents on page -->
    <div class="row">
        <!-- Column for picture -->
        <div class="col">
            <div class="thumbnail text-center">
                <img src="https://images.unsplash.com/photo-1506782081254-09bcfd996fd6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" class="rounded">
                <!-- Writing on top of Image -->
                <h1 class="text-over-img display-2">Join Us Today</h1>
            </div>
        </div>

        <!-- Column for user creation form -->
        <div class="col">
            <div class="row mx-auto my-4">
                <form:form action="/addUser"  modelAttribute="user">
                    <form:label path="firstName" class="h4 mt-4" >First Name: </form:label>
                    <form:input path="firstName" type="text" placeholder="Enter First Name . . ."/><br/>
                    <form:errors class="text-danger" path="firstName"/><br/>

                    <form:label path="lastName" class="h4 mt-4">Last Name: </form:label>
                    <form:input path="lastName" type="text" placeholder="Enter Last Name . . ."/><br/>
                    <form:errors class="text-danger" path="lastName"/><br/>

                    <form:label path="email" class="h4 mt-4">Email: </form:label>
                    <form:input path="email" type="text" placeholder="Enter Email Address . . ."/><br/>
                    <form:errors class="text-danger" path="email"/><br/>

                    <form:label path="userName" class="h4 mt-4">Username: </form:label>
                    <form:input path="userName" type="text" placeholder="Enter Username . . ."/><br/>
                    <form:errors class="text-danger" path="userName"/><br/>

                    <form:label path="password" class="h4 mt-4">Password: </form:label>
                    <form:input path="password" type="text" placeholder="Enter Password . . ."/><br/>
                    <form:errors class="text-danger" path="password"/><br/>

                    <input type="submit" value="Submit" class="mt-4 btn btn-success">
                </form:form>
            </div>
        </div>
    </div>
</div>

</body>
</html>