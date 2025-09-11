<%-- 
    Document   : login_page
    Created on : 3 Feb 2025, 4:38:10 pm
    Author     : HANUMANA RAM
--%>
<%--<%@page import="com.tech.blog.entities.Message"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            html, body {
            overflow-x: hidden;    /* stop horizontal scroll */
            scroll-behavior: smooth;
        }
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 66% 100%, 32% 95%, 0 100%, 0 0);
            }

/* 🌟 Body & Main Section */
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    height: 100vh;
    display: flex;
    flex-direction: column;
}

main.banner-background {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    overflow: hidden;
    position: relative;
    border-radius: 0 0 50% 50% / 5%;
    animation: gradientBG 12s ease infinite;
}

/* 🌟 Animated Gradient */
@keyframes gradientBG {
    0% {
background-position: 0% 50%;
}
    50% {
background-position: 100% 50%;
}
    100% {
background-position: 0% 50%;
}
}

/* 🌟 Floating Icons */
main.banner-background::before,
main.banner-background::after {
    content: "💻 ⚙️ ☁️ 📱";
    position: absolute;
    font-size: 3rem;
    opacity: 0.08;
    animation: floatIcons 10s infinite linear;
}
main.banner-background::before {
top: 20%;
left: 10%;
}
main.banner-background::after {
bottom: 15%;
right: 10%;
}

@keyframes floatIcons {
    0% {
transform: translateY(0) rotate(0deg);
}
    50% {
transform: translateY(-25px) rotate(10deg);
}
    100% {
transform: translateY(0) rotate(0deg);
}
}

/* 🌟 Card Styling */
.card {
    border-radius: 15px;
    box-shadow: 0 15px 30px rgba(0,0,0,0.3);
    border: none;
    overflow: hidden;
    transform: translateY(0);
    transition: all 0.3s ease;
    animation: fadeIn 1s ease forwards;
}

.card:hover {
    transform: translateY(-10px) scale(1.02);
    box-shadow: 0 20px 35px rgba(0,0,0,0.35);
}

/* 🌟 Card Header */
.card-header {
    background: linear-gradient(135deg, #2575fc, #6a11cb);
    color: #fff;
    font-size: 1.4rem;
    font-weight: bold;
    text-align: center;
    padding: 25px;
    letter-spacing: 1px;
}

/* 🌟 Input Fields */
.form-control {
    border-radius: 50px;
    padding: 10px 20px;
    border: 1px solid #ddd;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #fff;
    box-shadow: 0 0 10px rgba(255,255,255,0.5);
    background: rgba(255,255,255,0.1);
    color: #fff;
}

/* 🌟 Labels */
label {
    color: #fff;
    font-weight: 600;
}

/* 🌟 Submit Button */
.btn-primary {
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    border: none;
    border-radius: 50px;
    padding: 10px 30px;
    font-weight: bold;
    letter-spacing: 0.5px;
    transition: transform 0.2s, box-shadow 0.3s;
}

.btn-primary:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.3);
}

/* 🌟 Alert Styling */
.alert {
    border-radius: 15px;
    margin-top: 15px;
    text-align: center;
}

/* 🌟 Animations */
@keyframes fadeIn {
    0% {
opacity: 0;
transform: translateY(20px);
}
    100% {
opacity: 1;
transform: translateY(0);
}
}

/* 🌟 Responsive Adjustments */
@media(max-width: 768px) {
    main.banner-background::before,
    main.banner-background::after {
        display: none;
    }
    .card {
margin: 20px;
}
}

        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>

        <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span><br>Login here..
                            </div>
                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCssClass()%>" role="alert">
                                <%= m.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }
                            %>

                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>

                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>
                            </div>


                        </div>

                    </div>

                </div>

            </div>
        </main>






        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

    </body>
</html> --%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tech~Blog | Login</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          crossorigin="anonymous">

    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

    <style>
        html, body {
            overflow-x: hidden;
            scroll-behavior: smooth;
        }

        /* Shared Gradient Background */
        .gradient-bg {
            background: linear-gradient(135deg, #007bff, #6610f2, #6f42c1);
            background-size: 600% 600%;
            animation: gradientBG 12s ease infinite;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Floating icons */
        .gradient-bg::before {
            content: "💻 ⚙️ ☁️ 📱";
            position: absolute;
            font-size: 3rem;
            opacity: 0.08;
            animation: floatIcons 10s infinite linear;
            top: 20%; left: 10%;
        }
        @keyframes floatIcons {
            0% { transform: translateY(0); }
            50% { transform: translateY(-25px); }
            100% { transform: translateY(0); }
        }

        /* Login Card */
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.35);
            overflow: hidden;
            animation: fadeIn 1s ease forwards;
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(10px);
        }
        .card:hover {
            transform: translateY(-8px) scale(1.01);
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
        }

        .card-header {
            background: transparent;
            color: #fff;
            font-size: 1.6rem;
            font-weight: 600;
            text-align: center;
            padding: 25px;
            letter-spacing: 1px;
        }

        /* Input fields */
        label {
            color: #eee;
            font-weight: 500;
        }
        .form-control {
            border-radius: 30px;
            padding: 12px 20px;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.08);
            color: #fff;
        }
        .form-control::placeholder {
            color: rgba(255,255,255,0.6);
        }
        .form-control:focus {
            border-color: #fff;
            box-shadow: 0 0 12px rgba(255,255,255,0.6);
            background: rgba(255,255,255,0.15);
        }

        small.form-text {
            color: rgba(255,255,255,0.7) !important;
        }

        /* Themed Button */
        .btn-custom {
            border-radius: 30px;
            padding: 12px 30px;
            font-weight: bold;
            letter-spacing: 0.5px;
            transition: transform 0.2s, box-shadow 0.3s;
        }
        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        /* Extra link */
        .extra-links {
            margin-top: 15px;
            text-align: center;
        }
        .extra-links a {
            color: #fff;
            font-weight: 500;
            transition: color 0.3s;
        }
        .extra-links a:hover {
            color: #ffd700;
            text-decoration: none;
        }

        /* Fade In */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
<%@include file="normal_navbar.jsp" %>

<div class="gradient-bg">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card animate__animated animate__zoomIn">
                    <div class="card-header">
                        <i class="fa fa-user-circle fa-2x"></i><br>
                        Welcome Back 👋<br>
                        <small>Login to <b>Tech~Blog</b></small>
                    </div>

                    <% Message m = (Message) session.getAttribute("msg");
                       if (m != null) { %>
                        <div class="alert <%= m.getCssClass()%>" role="alert">
                            <%= m.getContent()%>
                        </div>
                    <% session.removeAttribute("msg"); } %>

                    <div class="card-body">
                        <form action="LoginServlet" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email Address</label>
                                <input name="email" required type="email" class="form-control"
                                       id="exampleInputEmail1" placeholder="Enter your email">
                                <small id="emailHelp" class="form-text">We respect your privacy.</small>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="password" type="password" class="form-control"
                                       id="exampleInputPassword1" placeholder="Enter your password">
                            </div>

                            <div class="text-center">
                                <button type="submit"
                                        class="btn btn-light btn-lg btn-custom animate__animated animate__pulse animate__infinite">
                                    <i class="fa fa-sign-in"></i> Login
                                </button>
                            </div>
                        </form>

                        <div class="extra-links">
                            <p class="mt-3">New here? <a href="register.jsp">Create an account</a></p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>

