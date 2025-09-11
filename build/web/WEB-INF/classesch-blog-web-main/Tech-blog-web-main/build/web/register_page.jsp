<%-- 
    Document   : register_page
    Created on : 3 Feb 2025, 5:01:18 pm
    Author     : HANUMANA RAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" crossorigin="anonymous">

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

        /* Gradient Background */
        .gradient-bg {
            background: linear-gradient(135deg, #007bff, #6610f2, #6f42c1);
            background-size: 600% 600%;
            animation: gradientBG 12s ease infinite;
            /*height: 100vh;*/
            min-height: 100vh;
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
            content: "🚀 💻 📚 ⚡";
            position: absolute;
            font-size: 3rem;
            opacity: 0.08;
            animation: floatIcons 10s infinite linear;
            top: 25%; left: 12%;
        }
        @keyframes floatIcons {
            0% { transform: translateY(0); }
            50% { transform: translateY(-25px); }
            100% { transform: translateY(0); }
        }

        /* Card Glass Effect */
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.35);
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(10px);
            animation: fadeIn 1s ease forwards;
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
        }

        /* Input Styling */
        label {
            color: #eee;
            font-weight: 500;
        }
        .form-control, .form-check-input {
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

        /* Loader */
        #loader h4 {
            color: #fff;
        }

        /* Fade In */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
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
    </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
       <!-- <main class="primary-background banner-background p-5" style="padding-bottom: 80px; ">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-user-circle"></span>
                            <br> 
                            Register here 
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter User Name">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br> 
                                    <input type="radio" id="gender" name="gender" value="male" >Male
                                    <input type="radio" id="gender" name="gender" value="female">Female
                                </div>
                                <div class="form-group">
                                    <textarea name="about" class="form-control" id=""  rows="3" placeholder="Enter Somthing about yourself..."></textarea>                                  
                                </div>
                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms & condition </label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa 4x"></span>
                                    <h4>please wait...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Sign Up</button>
                            </form>
                        </div>


                    </div>

                </div>

            </div>

        </main>-->
       
    <div class="gradient-bg">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card animate__animated animate__fadeInDown">
                    <div class="card-header">
                        <i class="fa fa-user-plus fa-2x"></i><br>
                        Create Your Account 🚀<br>
                        <small>Join the <b>Tech~Blog</b> community</small>
                    </div>

                    <div class="card-body">
                        <form id="reg-form" action="RegisterServlet" method="POST">
                            <div class="form-group">
                                <label for="user_name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter your name" required>
                            </div>

                            <div class="form-group">
                                <label for="user_email">Email Address</label>
                                <input name="user_email" type="email" class="form-control" id="user_email" placeholder="Enter your email" required>
                                <small class="form-text">We'll never share your email with anyone else.</small>
                            </div>

                            <div class="form-group">
                                <label for="user_password">Password</label>
                                <input name="user_password" type="password" class="form-control" id="user_password" placeholder="Enter your password" required>
                            </div>

                            <div class="form-group">
                                <label>Select Gender</label><br>
                                <input type="radio" name="gender" value="male"> Male
                                <input type="radio" name="gender" value="female"> Female
                            </div>

                            <div class="form-group">
                                <textarea name="about" class="form-control" rows="3" placeholder="Tell us about yourself..."></textarea>
                            </div>

                            <div class="form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1" required>
                                <label class="form-check-label" for="exampleCheck1">Agree Terms & Conditions</label>
                            </div>

                            <!-- Loader -->
                            <div class="container text-center mt-3" id="loader" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-2x text-light"></span>
                                <h4>Please wait...</h4>
                            </div>

                            <div class="text-center mt-3">
                                <button id="submit-btn" type="submit" class="btn btn-light btn-lg btn-custom animate__animated animate__pulse animate__infinite">
                                    <i class="fa fa-user-plus"></i> Sign Up
                                </button>
                            </div>
                        </form>

                        <div class="extra-links">
                            <p class="mt-3">Already have an account? <a href="login_page.jsp">Login here</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
</div>












        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
                $(document).ready(function () {
                    console.log("loaded......")
                    $('#reg-form').on('submit', function (event) {
                        event.preventDefault();
                        let form = new FormData(this);
                        //send register servlet :
                        $('#submit-btn').hide();
                        $('#loader').show();

                        $.ajax({
                            url: "RegisterServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                                console.log(data)
                                $('#submit-btn').show();
                                $('#loader').hide();
//                                swal("hello jani...");
                                if (data.trim() === 'done') {
                                    swal({
                                        title: "Success!",
                                        text: "Successfully Registered! Redirecting to Login..",
                                        icon: "success",
                                        button: "ok!"
                                    }).then((value) => {
                                        window.location = "login_page.jsp";
                                    });
                                } else {
                                    swal({
                                        title: "Error!",
                                        text: "Somthing went wrong....",
                                        icon: "error",
                                        button: "ok!"
                                    });
                                }

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(jqXHR)
                                $('#submit-btn').show();
                                $('#loader').hide();
                                swal({
                                    title: "Error!",
                                    text: "Somthing went wrong....",
                                    icon: "error",
                                    button: "ok!"
                                });
                            },
                            processData: false,
                            contentType: false

                        });

                    });
                });
        </script>
    </body>
</html>
