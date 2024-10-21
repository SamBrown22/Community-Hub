<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                const exampleText1 = "X=4\nY=10\nX=Y\nY=3";
                const exampleText2 = "X=3\nY=2"

                const myInput = document.getElementById("input-box");
                const exampleButton1 = document.getElementById("exampleButton1");
                const exampleButton2 = document.getElementById("exampleButton2");

                exampleButton1.addEventListener("click", function() {
                    myInput.value = exampleText1;
                });

                exampleButton2.addEventListener("click", function() {
                    myInput.value = exampleText2;
                });
            });
        </script>
        <style>
            html, body {
                height: 100%;
            }
            .marketing .col-lg-4 {
                margin-bottom:2rem;
                margin-top:2rem;
                text-align: center;
            }
            .map {
                width: 100%;
                min-height: 100%;
            }
        </style>
    </head>
    <body>
        <!-- Navigation Bar -->
        <nav class="navbar navbar-dark bg-gradient bg-black">
            <div class="container-fluid mx-2">

                <!-- Navigation Bar Title -->
                <a class="navbar-brand" href="/"><img src="https://i.ibb.co/0VQZcD7/1-1.png" width="50px" height="50px"><rect style="padding:1rem"/>Reversible Computation Community Hub </a>

                <!-- Row for Navigation panels(sign-up, login) -->
                <ul class="nav navbar-nav ms-auto flex-row">
                    <li class="nav-item me-4"> <a class="nav-link" href="/signup"><i class="fa-solid fa-user"></i> Sign-Up </a></li>
                    <li class="nav-item me-4"> <a class="nav-link" href="/login"><i class="fa-solid fa-right-to-bracket"></i> Login </a></li>
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
        <section style="background-color: #eee;" class="pt-4 map">
            <div class="container mt-2">

                <!-- Header -->
                <div class="row bg-dark mx-auto rounded">
                    <h2 class="fw-bolder text-center text-light py-2">Simulator</h2>
                </div>

                <!-- Description -->
                <div class="my-4 text-center">
                    <p class="lead">This simulator shows simple Reversible Computation by using a stack trace to keep a memory of what values were assigned to
                    each variable beforehand, allowing the program to return to its original state. The simulator allows for forward execution
                        as well as reversed execution.</br> </br>This Simulation only excepts assigning values for x and y with both variable containing 1
                    in its original state.</p>
                </div>

                <!-- Example Code Buttons -->
                <div>
                    <col>
                        <button class= "btn btn-primary px-4 mt-2 me-2" id="exampleButton1">Example 1</button>
                    </col>
                    <col>
                        <button class= "btn btn-primary px-4 mt-2" id="exampleButton2">Example 2</button>
                    </col>
                </div>

                <!-- Input Code Textarea with buttons to simulate -->
                <form:form action="/simulator">
                    <div class="form-group pt-4">
                        <label for="input-box">Enter code:</label>
                        <textarea class="form-control mb-4 bg-dark text-white" id="input-box" rows="8" name="code">${input}</textarea>
                        <div class="d-flex justify-content-center">

                            <button type="submit" class="btn btn-success me-4 mx-4" name="action" value="Backward">Step Backwards</button>

                            <button type="submit" class="btn btn-success px-4 mx-4" name="action" value="Sim">Simulate</button>

                            <button type="submit" class="btn btn-success mx-4" name="action" value="Forward">Step Forwards</button>
                        </div>
                    </div>
                </form:form>

                <!-- Output Textarea -->
                <div class="row form-group mt-2">
                    <div class = "col-md-6">
                        <label for="output-box">Output:</label>
                        <textarea class="form-control bg-dark text-white" id="output-box" rows="6" readonly>${output}</textarea>
                    </div>
                    <div class = "col-md-3">
                        <label for="output-box">Memory:</label>
                        <textarea class="form-control bg-dark text-white" rows="6" readonly>${memory}</textarea>
                    </div>
                    <div class = "col-md-3">
                        <label for="output-box">Stack:</label>
                        <textarea class="form-control bg-dark text-white" rows="6" readonly>${stack}</textarea>
                    </div>
                </div>

            </div>
        </section>
    </body>
</html>
