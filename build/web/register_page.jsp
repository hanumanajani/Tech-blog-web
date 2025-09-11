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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 66% 100%, 32% 95%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background banner-background p-5" style="padding-bottom: 80px; ">
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

        </main>












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
