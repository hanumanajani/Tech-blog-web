
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page  errorPage="error_page.jsp"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Programming Languages</a>
                    <a class="dropdown-item" href="#">Project Implementations</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structures</a>
                </div>
            </li>-->

<!--            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span class="fa fa-address-card"></span> Contact
                </a>
            </li>-->

            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">
                    <span class="fa fa-asterisk"></span> Do Post
                </a>
            </li>
        </ul>

        <!-- Right Menu -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal">
                    <span class="fa fa-user-circle"></span> <%= user.getName() %>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet">
                    <span class="fa fa-sign-out"></span> Logout
                </a>
            </li>
        </ul>

        <!-- Optional Search -->
        <form class="form-inline ml-3">
            <input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
            <button class="btn btn-outline-light" type="submit">Search</button>
        </form>
    </div>
</nav>

<!-- Gradient Animation -->
<style>
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}
</style>

        <!--*************************************end of navbar*********************************************************************************************************-->
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
            session.removeAttribute("msg"); ///-------------------
            }
        %>

        <!--main body of the page-->

        <main>
            <div class="container mt-3">
        <div class="row g-4">
            <!-- Categories Column -->
            <div class="col-md-4">
                <div class="glass-card p-3">
                    <h5 class="text-white mb-3">Categories</h5>
                    <div class="list-group">
                        <a href="#" onclick="getPosts(0,this)" 
                           class="c-link list-group-item list-group-item-action active">
                            All Posts
                        </a>
                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategoty();
                                for(Category cc: list1){
                                %>
                                <a href="#" onclick="getPosts(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                                <%
                                }
                            %>
                             
                        </div>
                    </div>
                              </div>
                    <!--2nd col--> 
                    <div class="col-md-8">
                        <!--posts-->
                        <div class="glass-card text-center py-5" id="loader">
                    <i class="fa fa-refresh fa-4x fa-spin text-white"></i>
                    <h4 class="text-white mt-3">Loading posts...</h4>
                </div>
                        <div class="container-fluid" id="post-container">
                            
                        </div>
            

                    </div>

                </div>

            </div>
          
                            <style>
/* Glassmorphic card for categories and loader */
.glass-card {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    transition: transform 0.3s, box-shadow 0.3s;
}
.glass-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 15px 25px rgba(0,0,0,0.3);
}

/* Category links */
.list-group-item {
    background: rgba(255,255,255,0.05);
    color: #fff;
    border: none;
    border-radius: 10px;
    margin-bottom: 5px;
    transition: all 0.3s;
}
.list-group-item:hover {
    background: rgba(255,255,255,0.2);
    color: #fff;
}
.list-group-item.active {
    background: linear-gradient(135deg, #007bff, #6610f2, #6f42c1);
    background-size: 400% 400%;
    animation: gradientBG 12s ease infinite;
    color: #fff;
    font-weight: bold;
}

/* Loader text */
#loader h4 {
    text-shadow: 0 1px 3px rgba(0,0,0,0.6);
}

/* Gradient animation keyframes */
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}
</style>

        </main>

        <!--end of main body of the page-->


        <!--add post model-->

        <!-- Modal -->
<%--        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddPostServlet" method="post" id="add-post-form">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled value="value">---Select Category---</option>
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
                                <input class="form-control" name="pTitle" type="text" placeholder="Enter Post Title"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" type="text" style="height:200px;" placeholder="Enter your  Content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" type="text" style="height:200px;" placeholder="Enter your program(if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input name="pic" type="file"/>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">POST</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>

--%>
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

<%--

        <!--start of profile modal-->

        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Tech~Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px;"/>

                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                            <!--details-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status : </th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on : </th>
                                            <td><%= user.getDateTime().toString()%> </td>

                                        </tr>        
                                    </tbody>
                                </table>
                            </div>
                            <!--profile Edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit CareFully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID : </td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email : </td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"/> </td>
                                        </tr>
                                        <tr>
                                            <td>Name : </td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"/> </td>
                                        </tr>
                                        <tr>
                                            <td>password : </td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"/> </td>
                                        </tr>
                                        <tr>
                                            <td>Gender : </td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>About: </td>
                                            <td>
                                                <textarea class="form-control" name="user_about" rows="3" >
                                                    <%= user.getAbout()%>
                                                </textarea> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td><input type="file" class="form-control" name="image"/> </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>                                                    
                                    </div>

                                </form>


                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->
--%>
<!--profile model and edit profile model--> 
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content profile-modal">
            <!-- Modal Header -->
            <div class="modal-header gradient-header text-white justify-content-center">
                <h5 class="modal-title" id="exampleModalLabel">Tech~Blog</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <div class="container text-center">
                    <img src="pics/<%= user.getProfile()%>" 
                         class="img-fluid profile-img mb-3"/>

                    <h5 class="modal-title text-white"><%= user.getName()%></h5>

                    <!-- Profile Details -->
                    <div id="profile-details">
                        <table class="table table-borderless text-white mt-3">
                            <tbody>
                                <tr>
                                    <th scope="row">ID :</th>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Status :</th>
                                    <td><%= user.getAbout()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Registered on :</th>
                                    <td><%= user.getDateTime().toString()%></td>
                                </tr>        
                            </tbody>
                        </table>
                    </div>

                    <!-- Profile Edit -->
                    <div id="profile-edit" style="display: none;">
                        <h5 class="text-white mt-2">Edit Your Profile</h5>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table table-borderless text-white">
                                <tr>
                                    <td>ID :</td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" /></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" /></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" /></td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td><%= user.getGender().toUpperCase() %></td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td><textarea class="form-control" name="user_about" rows="3"><%= user.getAbout()%></textarea></td>
                                </tr>
                                <tr>
                                    <td>New Profile :</td>
                                    <td><input type="file" class="form-control" name="image"/></td>
                                </tr>
                            </table>
                            <div class="text-center">
                                <button type="submit" class="btn btn-light btn-custom mt-2">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-light btn-custom" data-dismiss="modal">Close</button>
                <button id="edit-profile-button" type="button" class="btn btn-light btn-custom">Edit</button>
            </div>
        </div>
    </div>
</div>

<style>
/* Gradient header like navbar */
.gradient-header {
    background: linear-gradient(135deg, #007bff, #6610f2, #6f42c1);
    background-size: 400% 400%;
    animation: gradientBG 12s ease infinite;
    color: #fff;
    justify-content: center;
}

/* Modal overall glassmorphic theme */
.profile-modal {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(12px);
    border-radius: 15px;
    color: #fff;
}

/* Profile image */
.profile-img {
    border-radius: 50%;
    max-width: 150px;
    border: 3px solid rgba(255,255,255,0.3);
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

/* Buttons */
.btn-custom {
    border-radius: 25px;
    padding: 8px 25px;
    font-weight: bold;
    transition: transform 0.2s, box-shadow 0.3s;
}
.btn-custom:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.4);
}

/* Table text styling */
.table td, .table th {
    border-top: none;
    color: #fff;
}

/* Gradient animation keyframes */
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}
</style>


<!--end profile and profile edit model-->
        <br> 
        <%= user.getEmail()%>
        <br>
        <%= user.getAbout()%>


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
        
        
        
        
        <!--loading post using ajex-->
        <script>
            function getPosts(catId,temp){
                 $("#loader").show();
                 $("#post-container").hide();
                 $(".c-link").removeClass('active');
                 $.ajax({
                    url:"load_posts.jsp",
                    data:{cid:catId},
                    success: function(data ,textStatus,jqXHR){
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                    
                });
            }
            $(document).ready(function(e){
                let allPostRef = $('.c-link')[0];
                getPosts(0,allPostRef);               
                
            });
        </script>
    </body>
</html>
