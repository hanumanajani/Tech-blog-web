<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tech~Blog | Home</title>

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
            overflow-x: hidden;    /* stop horizontal scroll */
            scroll-behavior: smooth;
        }

        /* Animated Gradient Background (shared theme) */
        .gradient-bg {
            background: linear-gradient(135deg, #007bff, #6610f2, #6f42c1);
            background-size: 600% 600%;
            animation: gradientBG 12s ease infinite;
        }

        /* Hero Section */
        .hero-section {
            height: 100vh;
            color: white;
            position: relative;
            overflow: hidden;
        }
        .hero-section::before {
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

        /* Cards */
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0px 12px 25px rgba(0, 0, 0, 0.2);
        }

        /* Badges */
        .badge {
            margin: 3px;
            font-size: 0.9rem;
            transition: transform 0.3s ease;
        }
        .badge:hover {
            transform: scale(1.15);
        }

        /* Buttons */
        .btn-custom {
            border-radius: 30px;
            padding: 10px 25px;
        }
    </style>
</head>

<body>
<!-- Navbar -->
<%@include file="normal_navbar.jsp" %>

<!-- Hero Section -->
<div class="container-fluid p-0 m-0 gradient-bg hero-section d-flex align-items-center justify-content-center text-center">
    <div class="container">
        <h1 class="display-3 animate__animated animate__fadeInDown animate__slow">
            🚀 Welcome to <b>Tech~Blog</b>
        </h1>
        <p class="lead animate__animated animate__fadeInUp animate__delay-1s">
            Learn, Share & Explore the world of <b>Programming & Technology</b>.<br>
            Dive into blogs powered by JSP, Servlets & JDBC.
        </p>
        <div class="mt-4">
            <a href="register_page.jsp" class="btn btn-light btn-lg btn-custom animate__animated animate__heartBeat animate__infinite mr-2">
                <i class="fa fa-pencil"></i> Register Now
            </a>
            <a href="login_page.jsp" class="btn btn-outline-light btn-lg btn-custom animate__animated animate__fadeInRight animate__delay-2s">
                <i class="fa fa-user"></i> Login
            </a>
        </div>
    </div>
</div>

<!-- Features Section -->
<div class="container text-center my-5">
    <h2 class="mb-4 animate__animated animate__fadeInUp">Why <span class="text-primary">Tech~Blog?</span></h2>
    <div class="row">
        <div class="col-md-4 mb-3">
            <div class="card shadow h-100 animate__animated animate__zoomIn animate__delay-1s">
                <div class="card-body">
                    <i class="fa fa-code fa-3x mb-3 text-primary"></i>
                    <h5 class="card-title">Programming Blogs</h5>
                    <p class="card-text">Explore blogs on Java, Python, Web Development, and more with practical examples and deep insights.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card shadow h-100 animate__animated animate__zoomIn animate__delay-2s">
                <div class="card-body">
                    <i class="fa fa-database fa-3x mb-3 text-success"></i>
                    <h5 class="card-title">Backend Powered</h5>
                    <p class="card-text">Built with <b>JSP, Servlets, JDBC & MySQL</b>, ensuring robust performance and dynamic content delivery.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card shadow h-100 animate__animated animate__zoomIn animate__delay-3s">
                <div class="card-body">
                    <i class="fa fa-users fa-3x mb-3 text-danger"></i>
                    <h5 class="card-title">Community Driven</h5>
                    <p class="card-text">Join other developers, share knowledge, and contribute to a growing tech community.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Call to Action -->
<div class="container-fluid py-5 text-white gradient-bg text-center">
    <h2 class="animate__animated animate__flash animate__infinite">🚀 Start Your Coding Journey Today!</h2>
    <p class="lead animate__animated animate__fadeInUp">Create an account, write blogs, and connect with fellow tech enthusiasts.</p>
    <a href="register_page.jsp" class="btn btn-light btn-lg btn-custom animate__animated animate__heartBeat animate__infinite">
        <i class="fa fa-pencil"></i> Register Now
    </a>
</div>

<!-- Footer -->
<footer class="text-center text-white gradient-bg py-4">
    <h5 class="mb-3">⚙️ Technologies Used</h5>
    <p class="animate__animated animate__fadeInUp animate__slow">
        <span class="badge badge-light">HTML</span>
        <span class="badge badge-light">CSS</span>
        <span class="badge badge-light">Bootstrap</span>
        <span class="badge badge-light">JavaScript</span>
        <span class="badge badge-light">JSP</span>
        <span class="badge badge-light">Servlet</span>
        <span class="badge badge-light">Java</span>
        <span class="badge badge-light">JDBC</span>
        <span class="badge badge-light">MySQL</span>
    </p>
    <p class="mb-0">© 2025 <b>Tech~Blog</b> | Built with ❤️ for Developers</p>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>

