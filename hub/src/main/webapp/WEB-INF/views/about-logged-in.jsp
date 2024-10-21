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
<body>
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

</div>

<div class="bg-light">

    <div class="container py-5">

        <div class="row align-items-center">

            <div class="col-lg-10">

                <h1 class="display-4">Reversible computation general understanding</h1>

                <p class="lead text-muted mb-0">Computation refers to the abstract representation of physical processes in terms of states and transitions between states or events. A computation model, such as the Turing machine or the finite automaton, is used to define possible states and events. The mapping between the computation model and the physical system must be robust, meaning the states and events observed in the system correspond to the model. The system then evolves through a path of events until it reaches a final state. A function is said to be reversible if its output can determine the input, and irreversible if multiple inputs map to the same output. Physical laws are reversible, but a logically irreversible computation will result in a physical irreversibility in the system performing it, increasing the entropy of the environment. Irreversible computations can be made reversible by embedding them in larger computations that preserve all information. Toffoli and Fredkin gates are examples of universal reversible logic primitives.</p>

                <div>

                    <br>

                    <a href="http://strangepaths.com/reversible-computation/2008/01/20/en/" class="btn bg-success btn-primary target="_blank"">Find out more</a>

                </div>



            </div>

        </div>



        <div class="bg-light">

            <div class="container py-5">



                <div class="row align-items-center">



                    <div class="col-lg-10">

                        <h1 class="display-4">Reversible computation deep understanding</h2>

                            <p class="lead text-muted mb-0">Reversible computing is a field of computer science that deals with the design and implementation of computing systems that can reverse their computation, undo their effects, and restore the original state of the system. This is different from traditional computing systems that can only forward the computation but not reverse it. Reversible computing has applications in several fields such as quantum computing, low-power computing, and error correction.</p>

                            <p class="lead text-muted mb-0">Sure, the focus of reversible computing is to minimize the amount of entropy generated during computation, which results in lower energy consumption and reduced waste heat. This is important for various applications, such as embedded systems and mobile devices, where energy consumption is a critical concern.</p>



                            <div>

                                <br>

                                <a href="http://strangepaths.com/reversible-computation/2008/01/20/en/" class="btn bg-success btn-primary target="_blank"">Find out more</a>

                            </div>



                    </div>

                </div>

            </div>

        </div>







        <div class="bg-light">

            <div class="container py-5">



                <div class="row align-items-center">



                    <div class="col-lg-10">

                        <h1 class="display-4">The future of computation</h2>

                            <p class="lead text-muted mb-0">Reversible computing is important for the future of computing as it allows for more energy efficient computation and also offers potential solutions to problems faced by current computing technology. Reversible computing refers to computing that can be undone, enabling the system to go back to its initial state, thereby reducing energy waste. The article highlights the need for further research and development in this field to bring reversible computing to practical applications.</p>

                            <p class="lead text-muted mb-0">In addition, the article explains that reversible computing can play a significant role in quantum computing and has potential applications in areas such as cryptography, error correction, and secure cloud computing. The authors also discuss the challenges faced by the implementation of reversible computing, including the need for new hardware designs and the development of new programming models. They conclude by saying that the future of computing will likely be based on reversible computing and it is an exciting area for future research and development.</p>



                            <div>

                                <br>



                                <a href="https://spectrum.ieee.org/the-future-of-computing-depends-on-making-it-reversible" class="btn bg-success btn-primary target="_blank"">Find out more</a>



                            </div>



                    </div>

                </div>

            </div>

        </div>

</body>
</html>