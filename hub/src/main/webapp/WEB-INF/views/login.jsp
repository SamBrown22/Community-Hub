<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <title>Reversible Computation Community | Login</title>
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
</head>

<style>
    /* STRUCTURE */
    form {
        margin-top: 2em;
    }

    .wrapper {
        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: center;
        width: 100%;
        min-height: 100%;
        padding: 20px;
    }

    #formContent {
        -webkit-border-radius: 10px 10px 10px 10px;
        border-radius: 10px 10px 10px 10px;
        background: #fff;
        padding: 30px;
        width: 90%;
        max-width: 450px;
        position: relative;
        padding: 0px;
        -webkit-box-shadow: 0 30px 60px 0 rgb(0, 0, 0);
        box-shadow: 0 30px 60px 0 rgb(0, 0, 0);
        text-align: center;
    }

    #formFooter {
        background-color: #f6f6f6;
        border-top: 1px solid #dce8f1;
        padding: 25px;
        text-align: center;
        -webkit-border-radius: 0 0 10px 10px;
        border-radius: 0 0 10px 10px;
    }

    /* FORM TYPOGRAPHY*/

    input[type=button], input[type=submit], input[type=reset]  {
        background-color: #14A44D;
        border: none;
        color: white;
        padding: 15px 80px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        text-transform: uppercase;
        font-size: 13px;
        -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
        box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
        margin: 5px 20px 40px 20px;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -ms-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }

    input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
        background-color: #31a931;
    }

    input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
        -moz-transform: scale(0.95);
        -webkit-transform: scale(0.95);
        -o-transform: scale(0.95);
        -ms-transform: scale(0.95);
        transform: scale(0.95);
    }

    input[type=text] {
        background-color: rgba(231, 228, 228, 0.86);
        border: none;
        color: #0d0d0d;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px;
        width: 85%;
        border: 2px solid #f6f6f6;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
    }

    input[type=text]:focus {
        background-color: #fff;
        border-bottom: 2px solid #5fbae9;
    }

    input[type=text]::placeholder {
        color: #7a7878;
    }



    /* ANIMATIONS */

    /* Simple CSS3 Fade-in-down Animation */
    .fadeInDown {
        -webkit-animation-name: fadeInDown;
        animation-name: fadeInDown;
        -webkit-animation-duration: 1s;
        animation-duration: 1s;
        -webkit-animation-fill-mode: both;
        animation-fill-mode: both;
    }

    @-webkit-keyframes fadeInDown {
        0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
        }
        100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
        }
    }

    @keyframes fadeInDown {
        0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
        }
        100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
        }
    }

    /* Simple CSS3 Fade-in Animation */
    @-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
    @-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
    @keyframes fadeIn { from { opacity:0; } to { opacity:1; } }


    /* Simple CSS3 Fade-in Animation */
    .underlineHover:after {
        display: block;
        left: 0;
        bottom: -10px;
        width: 0;
        height: 2px;
        background-color: #5cb85c;
        content: "";
        transition: width 0.2s;
    }

    .underlineHover:hover {
        color: #0d0d0d;
    }

    .underlineHover:hover:after{
        width: 100%;
    }



    /* OTHERS */

    *:focus {
        outline: none;
    }

</style>

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

<!-- sign in form -->

<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Login Form -->
        <form:form action="/validateUser" modelAttribute="user">
            <form:input type="text" path="userName" class="fadeIn second" placeholder="User Name"/>
            <form:errors path="userName"/><br/>
            <form:input type="text" path="password" class="fadeIn second" placeholder="Password"/>
            <form:errors path="password"/><br/>
            <input type="submit" class="btn btn-success" value="Log In">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form:form>

        <!-- Remind Passowrd -->
        <div id="formFooter">
            <a class="underlineHover" href="/signup">Dont have an account?</a>
            <a class="underlineHover" href="/forgotPassword">Forgot Password?</a>
        </div>

    </div>
</div>