<%-- 
    Document   : show_blog_page
    Created on : 8 Feb 2025, 10:29:04 pm
    Author     : HANUMANA RAM
--%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%>|| Tech~Blog </title>
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
            .post-title{
                font-weight: 100;
                font-size: 30px;

            }
            .post-content{
                font-weight: 100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
            body{
                background:url(img/b1.png);
                background-size: cover;
                background-attachment:fixed;

            }

        </style>
    </head>
    <body>
        <!--navbar-->
<!--        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-cubes"></span> Tech~Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming language</a>
                            <a class="dropdown-item" href="#">project implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link disabled" href="#"><span class="fa fa-address-card"></span> Contact</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link disabled" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> Do Post</a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item active">
                        <a class="nav-link disabled" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName()%></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link disabled" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
                    </li>
                </ul>


            </div>
        </nav>-->
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark sticky-top" 
     style="background: linear-gradient(135deg, #007bff, #6610f2, #6f42c1); 
            background-size: 400% 400%; 
            animation: gradientBG 12s ease infinite;">

    <!-- Brand -->
    <a class="navbar-brand font-weight-bold" href="index.jsp">
        <span class="fa fa-cubes"></span> Tech~Blog
    </a>

    <!-- Toggler -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar Content -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Left Menu -->
        <ul class="navbar-nav mr-auto">
            <!-- Home -->
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">
                    <span class="fa fa-home"></span> Home
                </a>
            </li>

            <!-- Categories Dropdown -->
<!--            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
                   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-check-square-o"></span> Categories
                </a>
                <div class="dropdown-menu shadow-lg border-0 rounded">
                    <a class="dropdown-item" href="#"><i class="fa fa-code"></i> Programming Languages</a>
                    <a class="dropdown-item" href="#"><i class="fa fa-cogs"></i> Project Implementations</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#"><i class="fa fa-database"></i> Data Structures</a>
                </div>
            </li>

             Contact 
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span class="fa fa-address-card"></span> Contact
                </a>
            </li>-->

            <!-- Do Post -->
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">
                    <span class="fa fa-asterisk"></span> Do Post
                </a>
            </li>
        </ul>

        <!-- Right Menu -->
        <ul class="navbar-nav">
            <!-- Profile -->
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal">
                    <span class="fa fa-user-circle"></span> <%= user.getName() %>
                </a>
            </li>

            <!-- Logout -->
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet">
                    <span class="fa fa-sign-out"></span> Logout
                </a>
            </li>
        </ul>
    </div>
</nav>

<!-- Gradient Animation -->
<style>
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Navbar hover effects */
.navbar-nav .nav-link {
    transition: all 0.3s ease;
}
.navbar-nav .nav-link:hover {
    text-shadow: 0 0 8px rgba(255,255,255,0.8);
    transform: translateY(-2px);
}
.dropdown-menu .dropdown-item:hover {
    background: #f8f9fa;
    color: #6610f2;
    font-weight: 500;
}
</style>

        <!--end of navbar-->


        <!--main content of body-->

        <div class="container mt-4">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card shadow-lg rounded-3 border-0">
                <!-- Post Header -->
                <div class="card-header text-white text-center"
                     style="background: linear-gradient(45deg, #6a11cb, #2575fc);">
                            <h4 class="post-title mb-0"><%= p.getpTitle()%></h4>                         
                        </div>
                        <div class="card-body">
                            <img src="blog_pic/<%=p.getpPic()%>" class="card-img-top rounded mb-3 shadow-sm" alt="Card image cap">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                        <p class="mb-0 text-muted">
                            <i class="fa fa-user-circle"></i>
                            <a href="#" class="font-weight-bold text-dark">
                                    <%
                                        UserDao ud = new UserDao(ConnectionProvider.getConnection());

                                    %>
                                <%= ud.getUserByUserId(p.getUserId()).getName()%>
                            </a> posted:
                        </p>
                        <small class="text-muted">
                            <i class="fa fa-calendar"></i>
                            <%= DateFormat.getDateTimeInstance().format(p.getpDate())%>
                        </small>
                    </div>
<%--                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="col-md-8">
                                    <%
                                        UserDao ud = new UserDao(ConnectionProvider.getConnection());

                                    %>
                                    <p class="post-user-info"><a href="#"><%= ud.getUserByUserId(p.getUserId()).getName()%></a> has posted : </p>
                                </div>                                
                                <div class="col-md-4">
                                    <div class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></div>                                 
                                </div>                                
                            </div>--%>
                            <p class="post-content"><%= p.getpContent()%></p>
                            <br>
                            <br> 
<%--                            <div class="post-code"> 
                                <pre><%= p.getpCode()%></pre>
                            </div>--%>
 <% if(p.getpCode()!=null && !p.getpCode().trim().isEmpty()) { %>
                    <pre class="p-3 rounded bg-dark text-white mt-3" 
                         style="font-family: 'Courier New', monospace; white-space: pre-wrap;">
<%= p.getpCode()%>
                    </pre>
                    <% } %>

                        </div>
                    <div class="card-footer d-flex justify-content-start"
                     style="background: linear-gradient(45deg, #6a11cb, #2575fc);">
                    <%
                        LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    %>
                    <a href="#" 
                       onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" 
                       class="btn btn-light btn-sm shadow-sm mr-2">
                        <i class="fa fa-thumbs-o-up"></i> 
                        <span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span>
                    </a>
                </div>
<%--                        <div class="card-footer primary-background">
                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());

                            %>
                            <a href="#" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                            <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>

                        </div>--%>

                    </div>

                </div>

            </div>
        </div>



        <!--end of main content of body-->


        <!--add post model-->

        <!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content border-0 shadow-lg rounded-3">
            
            <!-- Modal Header -->
            <div class="modal-header text-white"
                 style="background: linear-gradient(45deg, #6a11cb, #2575fc);">
                <h5 class="modal-title"><i class="fa fa-pencil"></i> Create New Post</h5>
                <button type="button" class="close text-white" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="AddPostServlet" method="post" id="add-post-form" enctype="multipart/form-data">
                    <div class="form-group">
                        <select class="form-control" name="cid" required>
                            <option selected disabled>--- Select Category ---</option>
                                    <%                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategoty();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>" ><%= c.getName()%></option>
                                    <%
                                        }

                                    %>



                                </select>
                            </div>
                            <div class="form-group">
                        <input class="form-control" name="pTitle" type="text" placeholder="Enter Post Title" required/>
                    </div>

                    <div class="form-group">
                        <textarea name="pContent" class="form-control" rows="5" placeholder="Enter your Content" required></textarea>
                    </div>

                    <div class="form-group">
                        <textarea name="pCode" class="form-control" rows="5" placeholder="Enter your Program (if any)"></textarea>
                    </div>

                    <div class="form-group">
                        <label><i class="fa fa-image"></i> Upload Image</label>
                        <input name="pic" type="file" class="form-control-file"/>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-lg text-white px-4"
                                style="background: linear-gradient(45deg, #6a11cb, #2575fc);">
                            <i class="fa fa-paper-plane"></i> Publish Post
                        </button>
                    </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>




        <!--end post modal-->



        <!--start of profile modal-->

        <!-- Profile Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content border-0 shadow-lg rounded-3">
            
            <!-- Header -->
            <div class="modal-header text-white justify-content-center"
                 style="background: linear-gradient(45deg, #6a11cb, #2575fc);">
                <h5 class="modal-title font-weight-bold"><i class="fa fa-user-circle"></i> Profile - Tech~Blog</h5>
                <button type="button" class="close text-white position-absolute" style="right:15px;" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>

            <!-- Body -->
            <div class="modal-body">
                <div class="container text-center">
                    <!-- Profile Image -->
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid shadow-lg mb-3" 
                         style="border-radius: 50%; max-width: 150px; border: 4px solid #6a11cb;"/>

                            <h5 class="mt-2 font-weight-bold text-dark" id="exampleModalLabel"><%= user.getName()%></h5>
                            <!--details-->
                            <div id="profile-details">
                                <table class="table table-borderless table-sm text-left">

                                    <tbody>
                                        <tr>
                                            <th scope="row"><i class="fa fa-id-badge"></i>ID : </th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"><i class="fa fa-envelope"></i> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"><i class="fa fa-venus-mars"></i> Gender : </th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"><i class="fa fa-info-circle"></i> Status : </th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"><i class="fa fa-calendar"></i>  Registered on : </th>
                                            <td><%= user.getDateTime().toString()%> </td>

                                        </tr>        
                                    </tbody>
                                </table>
                            </div>
                            <!--profile Edit-->

                            <div id="profile-edit" style="display: none;">
                                <h5 class="text-primary mb-3">✏️ Edit Your Profile</h5>
                                <form action="EditServlet" method="post" enctype="multipart/form-data" class="text-left">
                                          <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" required>
                            </div>
                            <div class="form-group">
                                <label>About</label>
                                <textarea class="form-control" name="user_about" rows="3"><%= user.getAbout()%></textarea>
                            </div>
                            <div class="form-group">
                                <label>New Profile Picture</label>
                                <input type="file" class="form-control-file" name="image">
                            </div>
                            <div class="text-center">
                                <button type="submit" 
                                        class="btn text-white px-4"
                                        style="background: linear-gradient(45deg, #6a11cb, #2575fc);">
                                    <i class="fa fa-save"></i> Save Changes
                                </button>
                            </div>
                        </form>


                            </div>
                        </div>
                    </div>
                    <!-- Footer -->
            <div class="modal-footer d-flex justify-content-between">
                <button type="button" class="btn btn-secondary px-4" data-dismiss="modal">
                    <i class="fa fa-times"></i> Close
                </button>
                <button id="edit-profile-button" type="button" 
                        class="btn text-white px-4"
                        style="background: linear-gradient(45deg, #6a11cb, #2575fc);">
                    <i class="fa fa-edit"></i> Edit
                </button>
            </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->




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
                                        let editStatus = false;
                                        $('#edit-profile-button').click(function () {
                                            if (editStatus == false) {
                                                $('#profile-details').hide();
                                                $('#profile-edit').show();
                                                editStatus = true;
                                                $(this).text("Back");
                                            } else {
                                                $('#profile-details').show();
                                                $('#profile-edit').hide();
                                                editStatus = false;
                                                $(this).text("Edit");
                                            }
                                        });

                                    });
        </script>

        <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    //this code get call when form is submittted
                    event.preventDefault();
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "Saved Successfully!", "success");
                            } else {
                                swal("Error!", "Somthing went wrong", "error");
                            }
                            //success..
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!", "Somthing went wrong", "error");
                        },
                        processData: false,
                        contentType: false

                    });
                });
            });
        </script>
    </body>
</html>
